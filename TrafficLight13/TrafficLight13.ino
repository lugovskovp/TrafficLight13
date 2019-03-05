#include <limits.h>			// USHRT_MAX
#include <avr/sleep.h>		// Да, будем спать
#include <avr/interrupt.h>	// будет использоваться прерывание
#include <avr/pgmspace.h>	// Программная память для констант

#define ONE_SECOND	37		// количество переполнений счетчика в 1 секунду
#define QT_SECOND	9		// четверть секунды
#define MAX_GLOBAL_TIMER_VALUE	(USHRT_MAX / 2)		// uint16_t globalTimer - защита от переполнения. 65535 /2 
// любой период должен быть меньше, чем MAX_GLOBAL_TIMER_VALUE - 1
#define PERIOD_FLASH_GREEN	QT_SECOND			//период мигания зеленым цветом (четверть сек) - перед переключением в желтый
#define PERIOD_FLASH_YELLOW	ONE_SECOND * 1		//период мигания желтым цветом - регулировка светофором отключена - секунды
														// север --- восток
#define PERIOD_0		ONE_SECOND * 10		//R G R G	0. красный --- зеленый	(15 сек)
#define PERIOD_1		ONE_SECOND * 3		//R g R g	1. красный --- зеленый мигающий (3 сек)		
#define PERIOD_2		ONE_SECOND * 1		//R Y R Y	2. красный --- желтый (1 сек)
#define PERIOD_3		ONE_SECOND * 2		//RY Y RY Y	3. красн+желтый --- желтый (2 сек) 
#define PERIOD_4		ONE_SECOND * 7		//G R G R	4. зеленый --- красный	(10 сек)
#define PERIOD_5		ONE_SECOND * 3		//g R g R	5. зеленый мигающий --- красный(3 сек)
#define PERIOD_6		ONE_SECOND * 1		//Y R Y R	6. желтый --- красный (1сек)
#define PERIOD_7		ONE_SECOND * 2		//Y RY Y RY	7. желтый --- красный+желтый (2сек)


typedef struct{
	const uint8_t ddr_val_0;	// DDRB value при первом полутакте мигания
	const uint8_t port_val_0;	// PORTB value	
	const uint8_t ddr_val_1;	// DDRB value при втором полутакте мигания
	const uint8_t port_val_1;	// PORTB value
	const uint16_t flash_period;	// period of flasing - переключение между _val_1 и _val_0
	const uint16_t signal_period;	// period of this lighting state
}lightSignalization;			// состояние огней светофора, _0 и _1 - состояния при мигании, flash_long - время переключения мигания

// По принципиальной схеме (PINS === 0 0 0 g r y0 btt y1):
 // далее по этим определениям "собираются" байты состояний порта при компиляции
#define BUTTON		PB1
#define RED_PIN		PB3		// OUT: 1 - "север-юг" красный, 0 - "запад-восток" , IN - ни один, выключен, подтяжку не(!) включать
#define	YELLOW0_PIN	PB2		// OUT: 1 - желтый "север-юг" 
#define	YELLOW1_PIN	PB0		// OUT: 1 - желтый "запад-восток" 
#define	GREEN_PIN	PB4		// OUT: 1 - "север-юг" зеленый, 0 - "запад-восток" , IN - ни один, выключен, подтяжку не(!) включать
 
#define	BUTTON_ON  !(PINB & _BV(BUTTON))	//( (PINB & _BV(BUTTON)) == 0)	// условие "кнопка нажата"
#define	BUTTON_OFF	(PINB & _BV(BUTTON))	// ~(PINB & _BV(BUTTON)) -\\- "не нажата"

#define RED		_BV(RED_PIN)			// _BV - сдвиг влево единицы на количество(), 1<<VALUE
#define YELL0	_BV(YELLOW0_PIN)		//
#define YELL1	_BV(YELLOW1_PIN)
#define GREEN	_BV(GREEN_PIN)

// номера режимов работы в массиве 	lightSignalization traffic_signals[]
#define LIGHT_NUM_YELLOW_FLASH	8		// номер состояния порта при мигании желтым - включено - flash yellows lights
#define LIGHT_NUM_STD_START		0		// С какого номера начинается работа стандартного режима
#define LIGHT_NUM_LIGHTS_OFF	9		// номер состояния порта всё выключено - в спячке - traffic lights off
#define LIGHT_NUM_STD_MASK		7		// текущий_номер_состояния_светофора++ &LIGHT_NUM_STD_MASK - обеспечивает счетчик от 0 до 7 по кругу 

//.................................... ГЛОБАЛЬНЫЕ переменные
// 
const lightSignalization traffic_signals[] PROGMEM= {	// Порядок чередования сигналов, значения константные, хранятся во флеш-памяти, PINS === 0 0 0 g r y0 btt y1
 // {DDRB0, PORTB0,   DDRB_flashing, PORTB_flasinf (if flashing),   continous of half-period flashing,   continous id mode runing}
	{RED|GREEN, RED,   0, 0,   0, PERIOD_0},					// R G R G
	{RED, RED,  RED|GREEN, RED,   QT_SECOND, PERIOD_1},		// R g R g - flash east green
	{RED|YELL1, RED|YELL1,   0, 0,   0, PERIOD_2 },				// R Y1 R Y1
	{RED|YELL0|YELL1, RED|YELL0|YELL1,  0, 0,   0, PERIOD_3 },	// RY0 Y1 RY0 Y1
	{RED|GREEN, GREEN,   0, 0,   0, PERIOD_4},					// G R G R
	{RED|GREEN, GREEN,   RED, 0,    QT_SECOND, PERIOD_5 },		// g R g R - flash nord green
	{RED|YELL0, YELL0,   0, 0,   0, PERIOD_6},					// Y0 R Y0 R
	{RED|YELL0|YELL1,  YELL0|YELL1,   0, 0,   0, PERIOD_7  },	// Y0 RY1 Y0 RY1

	{YELL0|YELL1, YELL0|YELL1,   YELL0|YELL1, 0,  ONE_SECOND, 0},	// y0 y1 y0 y1 - flash yellows lights 
	{0, 0,   0, 0,   0, 0}				//  traffic lights off, 
};



volatile uint16_t  globalTimer;		//трачу два байта оперетивки из 64 на глобальный таймер
uint8_t	current_signal;		// 1 байт на текущее состояние, номер в traffic_signals
uint16_t tl_flash_end;		// 2 байта на время окончания периода мигания (если !0), 
uint16_t tl_signal_end;		// 2 байта на время окончания работы текущего сигнала и переключения на следующий (если !0)

//.................................... Прототипы функций
void setPeriods(uint8_t num, bool set_both_flash_and_signal);	// установка tl_flash_end, tl_signal_end
void setPorts(uint8_t num, bool use_main_values);				// установка режима работы портов

//.................................... Вектора прерываний
//
// часики - переполнение таймера инкрементирует globalTimer каждые 1/37 секунды
ISR(TIM0_OVF_vect){
	globalTimer++;	// а больше ничего тут делать не надо. Проснется, потом пробежит while(1) цикл и уснет.
}

int main() {
//
bool use_main_values = true;			// lightSignalization.ХХХ_val_0 (1) или lightSignalization.ХХХ_val_1 (0)? - если мигание
current_signal = LIGHT_NUM_STD_START;	// Установка режима работы. Кнопкой пока что не переключается.

	// Планировщик работает по схеме "а потом спи-отдыхай". 
	set_sleep_mode(SLEEP_MODE_IDLE);	//установить режим сна - см.даташит
	sleep_enable();					// разрешаем уход в сон

	TCCR0B = _BV(CS02) | _BV(CS00); // Тактирование таймера0 - clock frequency / 1024
	TIMSK0 |= _BV(TOIE0);			// При переполнении будет вызвано прерывание overflow interrupt

	sei();		// Глобально разрешаем обработку прерываний
	while(1){
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

				//если в режиме работы есть мигание (tl_flash_end !=0 )
		if(tl_flash_end){
			// и время смены мигания пришло
			if(globalTimer > tl_flash_end){
				use_main_values = !use_main_values;				// !use_main_values - или или одно из двух ))
				setPorts(current_signal, use_main_values);		// переключить режим текущего состояния на противоположный
				setPeriods(current_signal, false);				// обновить только следующий период мигания, но не состояния
			}
		}

		// если в режиме работы есть ограничение времени состояния - собственно это только operating_std отображение последовательности по ГОСТУ - красный-желтый-зеленый
		if(tl_signal_end){
			// и уже пора переключться на ледующий (use_main_values - чтобы переключение было с горящего зеленого - на желтый)
			if((globalTimer > tl_signal_end)  && use_main_values){
				current_signal ++;							// следующий сигнал светофора
				current_signal &= LIGHT_NUM_STD_MASK;		// обнулить биты выше 3-го, в основном режиме рабочие номера состояний с 0 по 7
				use_main_values = true;						// начинается - с нулевой пары состояний
				setPorts(current_signal, use_main_values);	// переключить режим текущего состояния на следующий в массиве
				setPeriods(current_signal, true);			// обновить следующий период мигания и период состояния
			}
		}
		
		sleep_cpu();	//и в самом конце бесконечного цикла - уходим в сон.
	}
}



	// установка значений портов
 void setPorts(uint8_t num, bool use_main_values){
	uint8_t val;
	DDRB = 0; PORTB = 0;
	// Если основной режим (мигания) - ddr_val_0, else = ddr_val_1
//	val = (use_main_values) ? pgm_read_byte_near(&(traffic_signals[num].ddr_val_0))
//							: pgm_read_byte_near(&(traffic_signals[num].ddr_val_1));

	// то же самое, но непонятно, некрасиво, арифметика указателей, данные в коде, зато на 14 (!!!) байт код короче.
	val = pgm_read_byte_near(&(traffic_signals[num].ddr_val_0)+( (use_main_values) ? 0 : 2) ); 
	val &= ~_BV(BUTTON);	// сброс бита пина кнопки - ВХОД
	DDRB = val;				// установка режима пинов порта
	
	val = (use_main_values) ? pgm_read_byte_near(&(traffic_signals[num].port_val_0)) 
							: pgm_read_byte_near(&(traffic_signals[num].port_val_1));
	val|= _BV(BUTTON);	// подтяжка на пине кнопки - активируется - срабатывание на низкий уровень
	PORTB = val;		// установка значений выходов и входов порта
}

 //Установить время окончания режима мигания (или 
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

//Program size: 610 bytes (used 60% of a 1 024 byte maximum) (0,58 secs)
//Minimum Memory Usage: 7 bytes (11% of a 64 byte maximum)