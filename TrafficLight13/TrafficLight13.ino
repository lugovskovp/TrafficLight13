#include <limits.h>			// USHRT_MAX
#include <avr/io.h>			// Для компиляции не из IDE
#include <avr/sleep.h>		// Да, будем спать
#include <avr/interrupt.h>	// будет использоваться прерывание
#include <avr/pgmspace.h>	// Программная память для констант

#ifdef GIMSK	// Если ATtiny13 - 
#define F_CPU 9600000UL		// компилируется не из ардуино среды, нужна скорость АЛУ
#define ONE_SECOND	37		// количество переполнений счетчика в 1 секунду
#define QT_SECOND	9		// четверть секунды
// GIMSK &= ~_BV(INT0); - запрет прерывания INT0  
#define DISABLE_EXTERNAL_INT0	GIMSK &= ~(_BV(INT0)); GIFR  &= ~(_BV(INTF0))	//EIMSK/EIFR у атмеги
//GIMSK |= _BV(INT0) - включить прерывание INT0
#define ENABLE_EXTERNAL_INT0	GIMSK |= _BV(INT0)	; GIFR  &= ~(_BV(INTF0))
#else			// мега328 - моя ардуинка нано
#define F_CPU 16000000UL
#define ONE_SECOND	64		// количество переполнений счетчика в 1 секунду - см. инициализацию таймера ниже
#define QT_SECOND	16		// четверть секунды
// АМ328 INT0 - ножка PD2... тут танцах вокруг единственного порта, малой кровью глубокий сон не забабахать (точнее, энергосбережение допиливать),
#define DISABLE_EXTERNAL_INT0	EIMSK &= ~(_BV(INT0)); EIFR  &= ~(_BV(INTF0)) 
// Увы, без эмуляции -  EICRA - ISC00-ISC01 == 00, lo level, EIMSK - INT0, EIFR-INTF0  
#define ENABLE_EXTERNAL_INT0	EIMSK |= _BV(INT0)	; EIFR  &= ~(_BV(INTF0))
#endif

#define MAX_GLOBAL_TIMER_VALUE	(USHRT_MAX / 2)		// uint16_t globalTimer - защита от переполнения. 65535 /2 
// любой период должен быть меньше, чем MAX_GLOBAL_TIMER_VALUE - 1
#define PERIOD_PRESS_BUTTON_SHORT	QT_SECOND/2			// Длительность короткого нажатия на кнопку (меньше - дребезг) - переключение состояний
#define PERIOD_PRESS_BUTTON_LONG	QT_SECOND*4			// Длительность долгого нажатия на кнопку - включение/выключение
#define PERIOD_FLASH_GREEN			QT_SECOND			// период мигания зеленым цветом (четверть сек) - перед переключением в желтый
#define PERIOD_FLASH_YELLOW			ONE_SECOND * 1		// период мигания желтым цветом - регулировка светофором отключена - секунды

											// север --- восток
#define PERIOD_0		ONE_SECOND * 5		// R G R G	0. красный --- зеленый	(15 сек)
#define PERIOD_1		ONE_SECOND * 3		//R g R g	1. красный --- зеленый мигающий (3 сек)		
#define PERIOD_2		ONE_SECOND * 1		//R Y R Y	2. красный --- желтый (1 сек)
#define PERIOD_3		ONE_SECOND * 2		//RY Y RY Y	3. красн+желтый --- желтый (2 сек) 
#define PERIOD_4		ONE_SECOND * 7		// G R G R	4. зеленый --- красный	(10 сек)
#define PERIOD_5		ONE_SECOND * 3		//g R g R	5. зеленый мигающий --- красный(3 сек)
#define PERIOD_6		ONE_SECOND * 1		//Y R Y R	6. желтый --- красный (1сек)
#define PERIOD_7		ONE_SECOND * 2		//Y RY Y RY	7. желтый --- красный+желтый (2сек)

//структура одного режима/состояния световой сигнализации. Может иметь второе значение - как быдет выглядеть при мигании
typedef struct{
	const uint8_t ddr_val_0;	// DDRB value при первом полутакте мигания
	const uint8_t port_val_0;	// PORTB value	
	const uint8_t ddr_val_1;	// DDRB value при втором полутакте мигания
	const uint8_t port_val_1;	// PORTB value
	const uint16_t flash_period;	// period of flasing - переключение между _val_1 и _val_0 (если =0, нет мигания)
	const uint16_t signal_period;	// period of this lighting state (если =0, то режим не будет переключен со временем)
}lightSignalization;			// состояние огней светофора, _0 и _1 - состояния при мигании, flash_long - время переключения мигания

// По принципиальной схеме (PINS === 0 0 0 g r y0 btt y1):
 // далее по этим определениям "собираются" байты состояний порта при компиляции
#define BUTTON_PIN	PB1		// вывод, у которого INT0. Кнопка, подтянута к питанию, нажатие = LOW
#define RED_PIN		PB3		// OUT: 1 - "север-юг" красный, 0 - "запад-восток" , IN - ни один, выключен, подтяжку не(!) включать
#define	YELLOW0_PIN	PB2		// OUT: 1 - желтый "север-юг" 
#define	YELLOW1_PIN	PB0		// OUT: 1 - желтый "запад-восток" 
#define	GREEN_PIN	PB4		// OUT: 1 - "север-юг" зеленый, 0 - "запад-восток" , IN - ни один, выключен, подтяжку не(!) включать
 
#define	BUTTON_ON  !(PINB & _BV(BUTTON_PIN))	//( (PINB & _BV(BUTTON)) == 0)	// условие "кнопка нажата"
#define	BUTTON_OFF	(PINB & _BV(BUTTON_PIN))	// ~(PINB & _BV(BUTTON)) -\\- "не нажата"

#define RED		_BV(RED_PIN)			// _BV - сдвиг влево единицы на количество(), 1<<VALUE
#define YELL0	_BV(YELLOW0_PIN)		// включение желтого на север-юг
#define YELL1	_BV(YELLOW1_PIN)
#define GREEN	_BV(GREEN_PIN)			// включение зеленого на север-юг (а если 0 - то на восток-запад) при DDR=1

// номера режимов работы в массиве lightSignalization traffic_signals[]
#define LIGHT_NUM_YELLOW_FLASH	8		// номер состояния порта при мигании желтым (нерегулирующем сигнале) - включено - flash yellows lights
#define LIGHT_NUM_STD_START		0		// С какого номера начинается работа стандартного режима (крас-жел-зел)
#define LIGHT_NUM_LIGHTS_OFF	9		// номер состояния порта всё выключено - в спячке - traffic lights off
#define LIGHT_NUM_START_SHOW	10		// номер состояния ВКЛЮЧЕНИЯ СВЕТОФОРА ПРИ СБРОСЕ ИЛИ ПОДАЧЕ ПИТАНИЯ
#define LIGHT_NUM_ERR			11		// отображение ошибки - частое мигание желтого и зеленого

#define MASK_LIGHT_NUM_STD		7		// текущий_номер_состояния_светофора++ &= LIGHT_NUM_STD_MASK - обеспечивает счетчик от 0 до 7 по кругу 

//.................................... ГЛОБАЛЬНЫЕ переменные
// 
const lightSignalization traffic_signals[] PROGMEM= {	// Порядок чередования сигналов, значения константные, хранятся во флеш-памяти, PINS === 0 0 0 g r y0 btt y1
 // {DDRB0, PORTB0,   DDRB_flashing, PORTB_flasinf (if flashing),   continous of half-period flashing,   continous id mode runing}
	{RED|GREEN, RED,   0, 0,   0, PERIOD_0},					// R G R G
	{RED, RED,  RED|GREEN, RED,   QT_SECOND, PERIOD_1},			// R g R g - flash east green
	{RED|YELL1, RED|YELL1,   0, 0,   0, PERIOD_2 },				// R Y1 R Y1
	{RED|YELL0|YELL1, RED|YELL0|YELL1,  0, 0,   0, PERIOD_3 },	// RY0 Y1 RY0 Y1
	{RED|GREEN, GREEN,   0, 0,   0, PERIOD_4},					// G R G R
	{RED|GREEN, GREEN,   RED, 0,    QT_SECOND, PERIOD_5 },		// g R g R - flash nord green
	{RED|YELL0, YELL0,   0, 0,   0, PERIOD_6},					// Y0 R Y0 R
	{RED|YELL0|YELL1,  YELL0|YELL1,   0, 0,   0, PERIOD_7  },	// Y0 RY1 Y0 RY1

	{YELL0|YELL1, YELL0|YELL1,   YELL0|YELL1, 0,  ONE_SECOND, 0},	// y0 y1 y0 y1 - flash yellows lights 
	{0, 0,   0, 0,   0, 0},				//  traffic lights off, 
	{RED|GREEN|YELL0, RED|YELL0,   RED|GREEN|YELL1, GREEN|YELL1,   1, PERIOD_2},		//  PERIOD_2 секунд - горят все красные и зеленые огни, ПРИ СБРОСЕ ИЛИ ПОДАЧЕ ПИТАНИЯ
	
	{YELL0|GREEN, YELL0,   YELL1|GREEN, YELL1|GREEN,  1, 0}		// ОШИБКА - часто мигают зеленые и желтые
};

volatile uint16_t  globalTimer;	// трачу два байта оперативки из 64 на глобальный таймер
uint8_t scan_button_cnt;		// один байт счетчик длительности нажатия кнопки
//uint16_t tl_flash_end;			// 2 байта на время окончания периода мигания (если !0), 
//uint16_t tl_signal_end;			// 2 байта на время окончания работы текущего сигнала и переключения на следующий (если !0)	
uint8_t f_button_state_flags;	// 1б, псевдорегистр машины состояний кнопки и вместилище булевых переменных
// итого, 8 байт на глобальные переменные

#pragma region bits_of_f_button_state_flags 
	// состояния машины состояний отслеживания кнопки MODES:  wakeup 11 -> work 00 -> tosleep 01 -> pwrdown 11 -> wakeup 11
#define MODE_LBIT 0
#define MODE_HBIT 1
#define MODE_VALUE			( f_button_state_flags & 3 )	// результат - численное значение MODE_
#define SET_MODE_WORK		f_button_state_flags &= ~(_BV(MODE_HBIT) );  f_button_state_flags &= ~(_BV(MODE_LBIT) );// 00 - work
//  f_button_state_flags &= ~( _BV(MODE_HBIT) | _BV(MODE_LBIT) ) - по размеру столько же, что странно
#define MODE_WORK_VALUE		0
#define SET_MODE_TOSLEEP	f_button_state_flags &= ~(_BV(MODE_HBIT)); f_button_state_flags |= _BV(MODE_LBIT)	// 01 - tosleep
#define MODE_TOSLEEP_VALUE	1
#define SET_MODE_PWRDOWN	f_button_state_flags |= _BV(MODE_HBIT); f_button_state_flags &= ~(_BV(MODE_LBIT))	// 10 - pwrdown	
#define MODE_PWRDOWN_VALUE	2
#define SET_MODE_WAKEUP		f_button_state_flags |= _BV(MODE_HBIT); f_button_state_flags |= _BV(MODE_LBIT)		// 11 - wakeup 	
#define MODE_WAKEUP_VALUE	3

#define FORCE_SET_NEW_SIGNAL_BIT		2	// в конце бесконечного цикла установить новый режим работы портов по значению в current_signal
#define IF_FORCE_SET_SIGNAL_FLAG		( f_button_state_flags & _BV(FORCE_SET_NEW_SIGNAL_BIT) )	// IF_ - в условие проверки флага
#define SET_FORCE_SET_SIGNAL_FLAG		f_button_state_flags |=  _BV(FORCE_SET_NEW_SIGNAL_BIT)		// SET_ - бит флага в 1
#define RES_FORCE_SET_SIGNAL_FLAG		f_button_state_flags &= ~( _BV(FORCE_SET_NEW_SIGNAL_BIT) )	// RES_ - бит флага в 0

// Еще 3й бит в запасе

#define LIGHT_SIGNAL_ALT_MODE_BIT		4	// стандартный=0 (красный-желтый-зеленый) или альтернативный=1 (желтый мигающий) режим работы светофора
#define IF_LIGHT_SIGNAL_ALT_MODE_FLAG	( f_button_state_flags & _BV(LIGHT_SIGNAL_ALT_MODE_BIT) )	//1(желтый мигающий) или 0(красный-желтый-зеленый) режим работы светофора?
#define SET_LIGHT_SIGNAL_ALT_MODE_FLAG	f_button_state_flags |=  _BV(LIGHT_SIGNAL_ALT_MODE_BIT)
#define RES_LIGHT_SIGNAL_ALT_MODE_FLAG	f_button_state_flags &= ~( _BV(LIGHT_SIGNAL_ALT_MODE_BIT) )
#define FLIP_LIGHT_SIGNAL_ALT_MODE_FLAG	f_button_state_flags ^= _BV(LIGHT_SIGNAL_ALT_MODE_BIT)

#define USE_FIRST_VALUES_LIGHT_BIT		5	// использовать первое значение пар ддр-порт структуры lightSignalization или второе
#define IF_USE_FIRST_VALUES_LIGHT_FLAG	(f_button_state_flags & _BV(USE_FIRST_VALUES_LIGHT_BIT)) // lightSignalization.ХХХ_val_0 (1) или lightSignalization.ХХХ_val_1 (0)? - если мигание
#define SET_USE_FIRST_VALUES_LIGHT_FLAG		f_button_state_flags |= _BV(USE_FIRST_VALUES_LIGHT_BIT)
#define RES_USE_FIRST_VALUES_LIGHT_FLAG		f_button_state_flags &= ~( _BV(USE_FIRST_VALUES_LIGHT_BIT))
#define FLIP_USE_FIRST_VALUES_LIGHT_FLAG	f_button_state_flags ^= _BV(USE_FIRST_VALUES_LIGHT_BIT)		// Инвертировать флаг

#define SHORT_PRESS_FLAG_BIT	6	// Булево, 1 когда счетчик нажатия кнопки больше короткого нажатия
#define IF_SHORT_PRESS_FLAG		( f_button_state_flags & _BV(SHORT_PRESS_FLAG_BIT) )		//условие - если значение == 1
#define SET_SHORT_PRESS_FLAG	f_button_state_flags |= _BV(SHORT_PRESS_FLAG_BIT)
#define RES_SHORT_PRESS_FLAG	f_button_state_flags &= ~(_BV(SHORT_PRESS_FLAG_BIT))

#define LONG_PRESS_FLAG_BIT		7 // Булево, 1 когда счетчик нажатия кнопки больше длинного нажатия
#define IF_LONG_PRESS_FLAG		( f_button_state_flags & _BV(LONG_PRESS_FLAG_BIT) )		//условие - если значение == 1
#define SET_LONG_PRESS_FLAG		f_button_state_flags |= _BV(LONG_PRESS_FLAG_BIT)
#define RES_LONG_PRESS_FLAG		f_button_state_flags &= ~(_BV(LONG_PRESS_FLAG_BIT))
#pragma endregion


//.................................... Прототипы функций
//void setPeriods(uint8_t num, bool set_both_flash_and_signal);	// установка tl_flash_end, tl_signal_end
void setPorts(uint8_t num, bool use_main_values);				// установка режима работы портов
void inline init_timer_clock(){		// тактирование таймера глобальной переменной времени
#ifdef GIMSK	// Если ATtiny13 - 
	TCCR0B = _BV(CS02) | _BV(CS00); // Тактирование таймера0 - clock frequency / 1024
	TIMSK0 |= _BV(TOIE0);			// При переполнении будет вызвано прерывание overflow interrupt
#else			// Если ардуино нано, атмега328/16м
	// 100 - prescaler 64; Foverflow = 16M/64*256 ~=976.56Hz,
	TCCR2B = (1<<CS22) | (1<<CS21) | (1<<CS20) ;  // 111 - CLK/1024, 16M/1024*254 - 1/64 секунды
	TIMSK2 |=(1<<TOIE0);  // interrupt ovfl enable
	//Serial.begin(115200);
#endif
}


//.................................... Обработчики прерываний
//
// Прерывание - часики - переполнение таймера инкрементирует globalTimer каждые 1/37 секунды
#ifdef GIMSK	// Если ATtiny13
ISR(TIM0_OVF_vect){
	globalTimer++;	// а больше ничего тут делать не надо. Проснется, потом пробежит while(1) цикл и уснет.
}
#else
// в ардуино таймер0 - непрозрачно задействован под собственные нужды, - или править ардуино-файлы - или просто уйти на Т2
ISR(TIMER2_OVF_vect){
	globalTimer++;
}
#endif
// Внешнее прерывание - нажатие на кнопку (точнее, изменение состояния, отслеживать же надо 0)
ISR(INT0_vect){
	DISABLE_EXTERNAL_INT0;
	SET_MODE_WAKEUP;		// прерывание разрешено только во сне POWER DOWN
	globalTimer = 0;		// проснувшись - сброс таймера
	scan_button_cnt = 0;	// сброс нажатий кнопки
	RES_SHORT_PRESS_FLAG;	//
	RES_LONG_PRESS_FLAG;	// и флагов
}

/*
// для отладки - видеть где программма работает
void inline dbg(){
	DDRB |= YELL0; PORTB ^= YELL0;
}
*/

//uint8_t current_signal __attribute__ ((section (".noinit")));
// uint8_t	current_signal;				// 1 байт на текущее состояние, номер в traffic_signals
//.................................... основная программа
//
//uint16_t useless_var __attribute__ ((section (".noinit")));

int main() {
	uint16_t tl_flash_end;			// 2 байта на время окончания периода мигания (если !0), 
	uint16_t tl_signal_end;			// 2 байта на время окончания работы текущего сигнала и переключения на следующий (если !0)	

	uint8_t	current_signal;				// 1 байт на текущее состояние, номер в traffic_signals
#pragma region Initialisation&setup
	// Планировщик работает по схеме "а потом спи-отдыхай". 
	set_sleep_mode(SLEEP_MODE_IDLE);	//установить режим сна - см.даташит
	sleep_enable();				// разрешаем уход в сон

	init_timer_clock();			// инициализация и запуск глобального таймера

	globalTimer = 0;			// проснувшись - сброс таймера
	SET_MODE_WORK;				// обработчик состояния нажатия кнопки
	SET_USE_FIRST_VALUES_LIGHT_FLAG;	//первая пара значений
	scan_button_cnt = 0;		// обнулить счетчик кнопки

	// Начало работы или сброс отобразить частым миганием
	current_signal = LIGHT_NUM_START_SHOW;	// Установка режима работы сигнализации - индикация подачи питания/перезагрузки
	SET_FORCE_SET_SIGNAL_FLAG;				// включить лампы согласно current_signal

	sei();		// Глобально разрешить обработку прерываний

#pragma endregion
	while(1){
		
#pragma region TimerOVF
		// переполнение глобального таймера? 
		if(globalTimer > MAX_GLOBAL_TIMER_VALUE){
			globalTimer -= MAX_GLOBAL_TIMER_VALUE;			// откатить глобальный таймер
			// 
			if(tl_flash_end){
				tl_flash_end -= MAX_GLOBAL_TIMER_VALUE;		// откатить период мигания, если есть
			}
			if(tl_signal_end){
				tl_signal_end -= MAX_GLOBAL_TIMER_VALUE;	// // откатить период состояния, если есть
			}
			// setPeriods(currentMode, false); // код на 12 байт меньше, но tl_.._end сбросятся в исходное, будет единичным увеличенным интервалом переключения
		}
#pragma endregion

#pragma region ButtonState
		//проверка нажатия кнопки
		if(BUTTON_ON){
			if(scan_button_cnt < USHRT_MAX){
				scan_button_cnt++;				// еще одна 1/37 секунды кнопка продолжала быть нажатой
			}
			// СБРОС флагов - дело тех, кто их ниже обработает
			if(scan_button_cnt > PERIOD_PRESS_BUTTON_SHORT){
				SET_SHORT_PRESS_FLAG;		// кстати, нажатие уже длиннее короткого нажатия, запомним
			}
			if(scan_button_cnt > PERIOD_PRESS_BUTTON_LONG){
				SET_LONG_PRESS_FLAG;		// и даже длиннее нажатия длинного
			}
		}
#pragma endregion
#pragma region LightWorkLogic
		//если в режиме работы есть мигание (tl_flash_end !=0 )
		if(tl_flash_end){
			// и время смены мигания пришло
			if(globalTimer > tl_flash_end){
				FLIP_USE_FIRST_VALUES_LIGHT_FLAG;				// !use_main_values - или или одно из двух ))
				setPorts(current_signal, IF_USE_FIRST_VALUES_LIGHT_FLAG);		// переключить режим текущего состояния на противоположный
				//setPeriods(current_signal, false);			// обновить только следующий период мигания, но не состояния
				tl_flash_end = pgm_read_word_near (&(traffic_signals[current_signal].flash_period));	// период мигания
				tl_flash_end = (tl_flash_end)? tl_flash_end + globalTimer : 0;	//время окончания режима мигания - если не нулевое значение 
			}
		}

		// если в режиме работы есть ограничение времени состояния 
		// - собственно это только operating_std отображение последовательности по ГОСТУ - красный-желтый-зеленый 
		// ну и индикация старта, который после +1 станет меньше 7
		if(tl_signal_end){
			// и уже пора переключться на cледующий (use_main_values - чтобы переключение было с горящего зеленого - на желтый)
			if((globalTimer > tl_signal_end)  && IF_USE_FIRST_VALUES_LIGHT_FLAG){
				current_signal ++;							// следующий сигнал светофора
				current_signal &= MASK_LIGHT_NUM_STD;		// обнулить биты выше 3-го, в основном режиме рабочие номера состояний с 0 по 7
				SET_FORCE_SET_SIGNAL_FLAG;		// включить лампы согласно current_signal
			}
		}
#pragma endregion

#pragma region MODE_VALUELogic
		// Машина состояний кнопки, 2 бита f_button_state_flags
		//? MODE_VALUE === pwrdown -> wakeup -> work -> tosleep -> pwrdown
		switch (MODE_VALUE){
		case (MODE_WAKEUP_VALUE):
			set_sleep_mode(SLEEP_MODE_IDLE);		// не спать!
			// лампы не включать, пока кнопка не нажата достаточно долго - IF_BUTTON_LONG_FLAG
			if(IF_LONG_PRESS_FLAG){
				// а не включена ли уже сигнализация? тогда включать свет!
				if(current_signal == LIGHT_NUM_LIGHTS_OFF){
					// последний раз перед засыпанием светофор был в режиме желтого мигающего? LIGHT_NUM_ERR
					current_signal = (IF_LIGHT_SIGNAL_ALT_MODE_FLAG) ? LIGHT_NUM_YELLOW_FLASH : LIGHT_NUM_STD_START;
					SET_FORCE_SET_SIGNAL_FLAG;		// включить лампы согласно current_signal
				}
			}
			//о, кнопку отжали...
			if(BUTTON_OFF){
				// а перед этим жали так долго, что светофор включился
				if(IF_LONG_PRESS_FLAG){
					SET_MODE_WORK;
				}else{	
					// А не, фальстарт, для включения недожали, спать дальше
					SET_MODE_PWRDOWN;	// на следующем цикле подготовит режим сна и заснет
				}
				scan_button_cnt = 0;	// в любом случае сбросить счетчик длительности нажатий
				RES_SHORT_PRESS_FLAG;	// и флаги нажатия, конечно
				RES_LONG_PRESS_FLAG;
			}
			break;

		case (MODE_WORK_VALUE):
			// кнопка нажималась?
			if(scan_button_cnt > 0){
				// Нажатие оооочень длинное?
				if(IF_LONG_PRESS_FLAG){
					current_signal = LIGHT_NUM_LIGHTS_OFF;		// гаси свет
					SET_FORCE_SET_SIGNAL_FLAG;					// бросай гранату - установить порты "свет выключен"
					SET_MODE_TOSLEEP;							// команда всем спать!
				}
				//Кнопку отпустили? 
				if(BUTTON_OFF){
					// нажата была дольше короткого трешхолда?
					if(IF_SHORT_PRESS_FLAG){
						FLIP_LIGHT_SIGNAL_ALT_MODE_FLAG;	// инвертировать флаг режима работы сигнализации
						current_signal = (IF_LIGHT_SIGNAL_ALT_MODE_FLAG) ? LIGHT_NUM_YELLOW_FLASH : LIGHT_NUM_STD_START; // на начальный номер выбр. режима
						SET_FORCE_SET_SIGNAL_FLAG;			// флаг установки режима лампы согласно current_signal
					}
					scan_button_cnt=0;
					RES_SHORT_PRESS_FLAG; //сброс флагов нажатия и счетчика
					RES_LONG_PRESS_FLAG;
				}
			}
			break;

		case (MODE_TOSLEEP_VALUE):
			// Выход из состояния - только по отжатой кнопке.
			if(BUTTON_OFF){
				SET_MODE_PWRDOWN;		// На следующем цикле уснет
			}
			break;

		case (MODE_PWRDOWN_VALUE):
			// О! доброе утро, проснулись! Нажата кнопка?
			if(BUTTON_ON){
				set_sleep_mode(SLEEP_MODE_IDLE);
				SET_MODE_WAKEUP;
			}else{	
				// Не нажата? Спать дальше.
				scan_button_cnt = 0;
				RES_LONG_PRESS_FLAG;
				RES_SHORT_PRESS_FLAG;
				current_signal = LIGHT_NUM_LIGHTS_OFF;		//гаси свет
				SET_FORCE_SET_SIGNAL_FLAG;
				set_sleep_mode(SLEEP_MODE_PWR_DOWN);	// теперь крепко уснет - в конце while(1)
				ENABLE_EXTERNAL_INT0;					// разрешить прерывание по нажатию кнопки
			}
			break;

		default:
			//! Что то пошло совсем не так - подать индикацию ошибки сюда. Вообще - невозможное состояние при правильно написанной программе
			current_signal = LIGHT_NUM_ERR;
			SET_FORCE_SET_SIGNAL_FLAG;
			//setPorts(current_signal,true);
			//setPeriods(current_signal,true);
			break;
		}
#pragma endregion

		// Высшие строки решили, что надо переключить состояние в какое-то другое?
		if(IF_FORCE_SET_SIGNAL_FLAG){		// Флаг принудительной установки состояния сигнализации по current_signal
			RES_FORCE_SET_SIGNAL_FLAG;		// сброс флага
			SET_USE_FIRST_VALUES_LIGHT_FLAG;	// Новый режим - начинать с 0-го значения пары ддр-порт
			setPorts(current_signal, IF_USE_FIRST_VALUES_LIGHT_FLAG);	// переключить режим текущего состояния на #current_signal в массиве
			//setPeriods(current_signal, true);
			tl_flash_end = pgm_read_word_near (&(traffic_signals[current_signal].flash_period));	// период мигания
			tl_flash_end = (tl_flash_end)? tl_flash_end + globalTimer : 0;	//время окончания режима мигания - если не нулевое значение 
			tl_signal_end = pgm_read_word_near(&(traffic_signals[current_signal].signal_period));	
			tl_signal_end = (tl_signal_end)? tl_signal_end + globalTimer : 0;			// время переключения на следующий режим, если не нулевое значение
		}
		// спать еще на 1/37 секунды. Или, может, и дольше.
		sleep_cpu();	//и в самом конце бесконечного главного цикла - уходим в сон.
	}
}


//.................................... функции
//
// установка значений порта В
 void setPorts(uint8_t num, bool  use_main_values){
	uint8_t val;
	DDRB = 0; PORTB = 0;
	// Если основной режим (мигания) - ddr_val_0, else = ddr_val_1
//	val = (use_main_values) ? pgm_read_byte_near(&(traffic_signals[num].ddr_val_0))
//							: pgm_read_byte_near(&(traffic_signals[num].ddr_val_1));

	// то же самое, но не так понятно, арифметика указателей, данные в коде, зато на 14 (!!!) байт код легче.
	val = pgm_read_byte_near(&(traffic_signals[num].ddr_val_0)+( (use_main_values) ? 0 : sizeof(uint8_t)*2 ) ); 

	val &= ~_BV(BUTTON_PIN);	// сброс бита пина кнопки, она всегда включена - ВХОД
	DDRB = val;					// установка режима пинов порта
	
	val = (use_main_values) ? pgm_read_byte_near(&(traffic_signals[num].port_val_0)) 
							: pgm_read_byte_near(&(traffic_signals[num].port_val_1));
	val|= _BV(BUTTON_PIN);	// подтяжка на пине кнопки - активируется - срабатывание на низкий уровень
	PORTB = val;		// установка значений выходов и входов порта
}


 

 /*
 //Установить время окончания режима мигания (или длительность работы режима сигнализации)
void setPeriods(uint8_t num, bool set_both_flash_and_signal){
// глобальные переменные
	tl_flash_end = pgm_read_word_near (&(traffic_signals[num].flash_period));	// период мигания
	tl_flash_end = (tl_flash_end)? tl_flash_end + globalTimer : 0;	//время окончания режима мигания - если не нулевое значение периода	
	//if(tl_flash_end){ 		tl_flash_end += globalTimer; 	} <- вот так код на 8 байт длиннее

	// если установить оба периода - и состояния и мигания
	if(set_both_flash_and_signal){
		tl_signal_end = pgm_read_word_near(&(traffic_signals[num].signal_period));	
		tl_signal_end = (tl_signal_end)? tl_signal_end + globalTimer : 0;			// время переключения на следующий режим, если не нулевое значение
	}
}
*/

//Program size: 976 bytes (used 95% of a 1 024 byte maximum) (1,59 secs)
//Minimum Memory Usage: 8 bytes (13% of a 64 byte maximum)
