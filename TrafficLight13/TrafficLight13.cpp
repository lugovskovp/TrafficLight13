#include <limits.h>			// USHRT_MAX
#include <avr/io.h>			// ��� ���������� �� �� IDE
#include <avr/sleep.h>		// ��, ����� �����
#include <avr/interrupt.h>	// ����� �������������� ����������
#include <avr/pgmspace.h>	// ����������� ������ ��� ��������

#ifdef GIMSK	// ���� ATtiny13 - 
#define F_CPU 9600000UL		// ������������� �� �� ������� �����, ����� �������� ���
#define ONE_SECOND	37		// ���������� ������������ �������� � 1 �������
#define QT_SECOND	9		// �������� �������
// GIMSK &= ~_BV(INT0); - ������ ���������� INT0  
#define DISABLE_EXTERNAL_INT0	GIMSK &= ~(_BV(INT0)); GIFR  &= ~(_BV(INTF0))	//EIMSK/EIFR � ������
//GIMSK |= _BV(INT0) - �������� ���������� INT0
#define ENABLE_EXTERNAL_INT0	GIMSK |= _BV(INT0)	; GIFR  &= ~(_BV(INTF0))
#else			// ����328 - ��� �������� ����
#define F_CPU 16000000UL
#define ONE_SECOND	64		// ���������� ������������ �������� � 1 ������� - ��. ������������� ������� ����
#define QT_SECOND	16		// �������� �������
// ��328 INT0 - ����� PD2... ��� ������ ������ ������������� �����, ����� ������ �������� ��� �� ���������� (������, ���������������� ����������),
#define DISABLE_EXTERNAL_INT0	EIMSK &= ~(_BV(INT0)); EIFR  &= ~(_BV(INTF0)) 
// ���, ��� �������� -  EICRA - ISC00-ISC01 == 00, lo level, EIMSK - INT0, EIFR-INTF0  
#define ENABLE_EXTERNAL_INT0	EIMSK |= _BV(INT0)	; EIFR  &= ~(_BV(INTF0))
#endif

#define MAX_GLOBAL_TIMER_VALUE	(USHRT_MAX / 2)		// uint16_t globalTimer - ������ �� ������������. 65535 /2 
// ����� ������ ������ ���� ������, ��� MAX_GLOBAL_TIMER_VALUE - 1
#define PERIOD_PRESS_BUTTON_SHORT	QT_SECOND/2			// ������������ ��������� ������� �� ������ (������ - �������) - ������������ ���������
#define PERIOD_PRESS_BUTTON_LONG	QT_SECOND*4			// ������������ ������� ������� �� ������ - ���������/����������
#define PERIOD_FLASH_GREEN			QT_SECOND			// ������ ������� ������� ������ (�������� ���) - ����� ������������� � ������
#define PERIOD_FLASH_YELLOW			ONE_SECOND * 1		// ������ ������� ������ ������ - ����������� ���������� ��������� - �������

											// ����� --- ������
#define PERIOD_0		ONE_SECOND * 5		// R G R G	0. ������� --- �������	(15 ���)
#define PERIOD_1		ONE_SECOND * 3		//R g R g	1. ������� --- ������� �������� (3 ���)		
#define PERIOD_2		ONE_SECOND * 1		//R Y R Y	2. ������� --- ������ (1 ���)
#define PERIOD_3		ONE_SECOND * 2		//RY Y RY Y	3. �����+������ --- ������ (2 ���) 
#define PERIOD_4		ONE_SECOND * 7		// G R G R	4. ������� --- �������	(10 ���)
#define PERIOD_5		ONE_SECOND * 3		//g R g R	5. ������� �������� --- �������(3 ���)
#define PERIOD_6		ONE_SECOND * 1		//Y R Y R	6. ������ --- ������� (1���)
#define PERIOD_7		ONE_SECOND * 2		//Y RY Y RY	7. ������ --- �������+������ (2���)

//��������� ������ ������/��������� �������� ������������. ����� ����� ������ �������� - ��� ����� ��������� ��� �������
typedef struct{
	const uint8_t ddr_val_0;	// DDRB value ��� ������ ��������� �������
	const uint8_t port_val_0;	// PORTB value	
	const uint8_t ddr_val_1;	// DDRB value ��� ������ ��������� �������
	const uint8_t port_val_1;	// PORTB value
	const uint16_t flash_period;	// period of flasing - ������������ ����� _val_1 � _val_0 (���� =0, ��� �������)
	const uint16_t signal_period;	// period of this lighting state (���� =0, �� ����� �� ����� ���������� �� ��������)
}lightSignalization;			// ��������� ����� ���������, _0 � _1 - ��������� ��� �������, flash_long - ����� ������������ �������

// �� �������������� ����� (PINS === 0 0 0 g r y0 btt y1):
 // ����� �� ���� ������������ "����������" ����� ��������� ����� ��� ����������
#define BUTTON_PIN	PB1		// �����, � �������� INT0. ������, ��������� � �������, ������� = LOW
#define RED_PIN		PB3		// OUT: 1 - "�����-��" �������, 0 - "�����-������" , IN - �� ����, ��������, �������� ��(!) ��������
#define	YELLOW0_PIN	PB2		// OUT: 1 - ������ "�����-��" 
#define	YELLOW1_PIN	PB0		// OUT: 1 - ������ "�����-������" 
#define	GREEN_PIN	PB4		// OUT: 1 - "�����-��" �������, 0 - "�����-������" , IN - �� ����, ��������, �������� ��(!) ��������
 
#define	BUTTON_ON  !(PINB & _BV(BUTTON_PIN))	//( (PINB & _BV(BUTTON)) == 0)	// ������� "������ ������"
#define	BUTTON_OFF	(PINB & _BV(BUTTON_PIN))	// ~(PINB & _BV(BUTTON)) -\\- "�� ������"

#define RED		_BV(RED_PIN)			// _BV - ����� ����� ������� �� ����������(), 1<<VALUE
#define YELL0	_BV(YELLOW0_PIN)		// ��������� ������� �� �����-��
#define YELL1	_BV(YELLOW1_PIN)
#define GREEN	_BV(GREEN_PIN)			// ��������� �������� �� �����-�� (� ���� 0 - �� �� ������-�����) ��� DDR=1

// ������ ������� ������ � ������� lightSignalization traffic_signals[]
#define LIGHT_NUM_YELLOW_FLASH	8		// ����� ��������� ����� ��� ������� ������ (�������������� �������) - �������� - flash yellows lights
#define LIGHT_NUM_STD_START		0		// � ������ ������ ���������� ������ ������������ ������ (����-���-���)
#define LIGHT_NUM_LIGHTS_OFF	9		// ����� ��������� ����� �� ��������� - � ������ - traffic lights off
#define LIGHT_NUM_START_SHOW	10		// ����� ��������� ��������� ��������� ��� ������ ��� ������ �������
#define LIGHT_NUM_ERR			11		// ����������� ������ - ������ ������� ������� � ��������

#define MASK_LIGHT_NUM_STD		7		// �������_�����_���������_���������++ &= LIGHT_NUM_STD_MASK - ������������ ������� �� 0 �� 7 �� ����� 

//.................................... ���������� ����������
// 
const lightSignalization traffic_signals[] PROGMEM= {	// ������� ����������� ��������, �������� �����������, �������� �� ����-������, PINS === 0 0 0 g r y0 btt y1
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
	{RED|GREEN|YELL0, RED|YELL0,   RED|GREEN|YELL1, GREEN|YELL1,   1, PERIOD_2},		//  PERIOD_2 ������ - ����� ��� ������� � ������� ����, ��� ������ ��� ������ �������
	
	{YELL0|GREEN, YELL0,   YELL1|GREEN, YELL1|GREEN,  1, 0}		// ������ - ����� ������ ������� � ������
};

volatile uint16_t  globalTimer;	// ����� ��� ����� ���������� �� 64 �� ���������� ������
uint8_t scan_button_cnt;		// ���� ���� ������� ������������ ������� ������
uint16_t tl_flash_end;			// 2 ����� �� ����� ��������� ������� ������� (���� !0), 
uint16_t tl_signal_end;			// 2 ����� �� ����� ��������� ������ �������� ������� � ������������ �� ��������� (���� !0)	
uint8_t f_button_state_flags;	// 1�, ������������� ������ ��������� ������ � ���������� ������� ����������
// �����, 8 ���� �� ���������� ����������

#pragma region bits_of_f_button_state_flags 
	// ��������� ������ ��������� ������������ ������ MODES:  wakeup 11 -> work 00 -> tosleep 01 -> pwrdown 11 -> wakeup 11
#define MODE_LBIT 0
#define MODE_HBIT 1
#define MODE_VALUE			( f_button_state_flags & 3 )	// ��������� - ��������� �������� MODE_
#define SET_MODE_WORK		f_button_state_flags &= ~(_BV(MODE_HBIT) );  f_button_state_flags &= ~(_BV(MODE_LBIT) );// 00 - work
//  f_button_state_flags &= ~( _BV(MODE_HBIT) | _BV(MODE_LBIT) ) - �� ������� ������� ��, ��� �������
#define MODE_WORK_VALUE		0
#define SET_MODE_TOSLEEP	f_button_state_flags &= ~(_BV(MODE_HBIT)); f_button_state_flags |= _BV(MODE_LBIT)	// 01 - tosleep
#define MODE_TOSLEEP_VALUE	1
#define SET_MODE_PWRDOWN	f_button_state_flags |= _BV(MODE_HBIT); f_button_state_flags &= ~(_BV(MODE_LBIT))	// 10 - pwrdown	
#define MODE_PWRDOWN_VALUE	2
#define SET_MODE_WAKEUP		f_button_state_flags |= _BV(MODE_HBIT); f_button_state_flags |= _BV(MODE_LBIT)		// 11 - wakeup 	
#define MODE_WAKEUP_VALUE	3

#define FORCE_SET_NEW_SIGNAL_BIT		2	// � ����� ������������ ����� ���������� ����� ����� ������ ������ �� �������� � current_signal
#define IF_FORCE_SET_SIGNAL_FLAG		( f_button_state_flags & _BV(FORCE_SET_NEW_SIGNAL_BIT) )	// IF_ - � ������� �������� �����
#define SET_FORCE_SET_SIGNAL_FLAG		f_button_state_flags |=  _BV(FORCE_SET_NEW_SIGNAL_BIT)		// SET_ - ��� ����� � 1
#define RES_FORCE_SET_SIGNAL_FLAG		f_button_state_flags &= ~( _BV(FORCE_SET_NEW_SIGNAL_BIT) )	// RES_ - ��� ����� � 0

// ��� 3� ��� � ������

#define LIGHT_SIGNAL_ALT_MODE_BIT		4	// �����������=0 (�������-������-�������) ��� ��������������=1 (������ ��������) ����� ������ ���������
#define IF_LIGHT_SIGNAL_ALT_MODE_FLAG	( f_button_state_flags & _BV(LIGHT_SIGNAL_ALT_MODE_BIT) )	//1(������ ��������) ��� 0(�������-������-�������) ����� ������ ���������?
#define SET_LIGHT_SIGNAL_ALT_MODE_FLAG	f_button_state_flags |=  _BV(LIGHT_SIGNAL_ALT_MODE_BIT)
#define RES_LIGHT_SIGNAL_ALT_MODE_FLAG	f_button_state_flags &= ~( _BV(LIGHT_SIGNAL_ALT_MODE_BIT) )
#define FLIP_LIGHT_SIGNAL_ALT_MODE_FLAG	f_button_state_flags ^= _BV(LIGHT_SIGNAL_ALT_MODE_BIT)

#define USE_FIRST_VALUES_LIGHT_BIT		5	// ������������ ������ �������� ��� ���-���� ��������� lightSignalization ��� ������
#define IF_USE_FIRST_VALUES_LIGHT_FLAG	(f_button_state_flags & _BV(USE_FIRST_VALUES_LIGHT_BIT)) // lightSignalization.���_val_0 (1) ��� lightSignalization.���_val_1 (0)? - ���� �������
#define SET_USE_FIRST_VALUES_LIGHT_FLAG		f_button_state_flags |= _BV(USE_FIRST_VALUES_LIGHT_BIT)
#define RES_USE_FIRST_VALUES_LIGHT_FLAG		f_button_state_flags &= ~( _BV(USE_FIRST_VALUES_LIGHT_BIT))
#define FLIP_USE_FIRST_VALUES_LIGHT_FLAG	f_button_state_flags ^= _BV(USE_FIRST_VALUES_LIGHT_BIT)		// ������������� ����

#define SHORT_PRESS_FLAG_BIT	6	// ������, 1 ����� ������� ������� ������ ������ ��������� �������
#define IF_SHORT_PRESS_FLAG		( f_button_state_flags & _BV(SHORT_PRESS_FLAG_BIT) )		//������� - ���� �������� == 1
#define SET_SHORT_PRESS_FLAG	f_button_state_flags |= _BV(SHORT_PRESS_FLAG_BIT)
#define RES_SHORT_PRESS_FLAG	f_button_state_flags &= ~(_BV(SHORT_PRESS_FLAG_BIT))

#define LONG_PRESS_FLAG_BIT		7 // ������, 1 ����� ������� ������� ������ ������ �������� �������
#define IF_LONG_PRESS_FLAG		( f_button_state_flags & _BV(LONG_PRESS_FLAG_BIT) )		//������� - ���� �������� == 1
#define SET_LONG_PRESS_FLAG		f_button_state_flags |= _BV(LONG_PRESS_FLAG_BIT)
#define RES_LONG_PRESS_FLAG		f_button_state_flags &= ~(_BV(LONG_PRESS_FLAG_BIT))
#pragma endregion


//.................................... ��������� �������
void setPeriods(uint8_t num, bool set_both_flash_and_signal);	// ��������� tl_flash_end, tl_signal_end
void setPorts(uint8_t num, bool use_main_values);				// ��������� ������ ������ ������
void inline init_timer_clock(){		// ������������ ������� ���������� ���������� �������
#ifdef GIMSK	// ���� ATtiny13 - 
	TCCR0B = _BV(CS02) | _BV(CS00); // ������������ �������0 - clock frequency / 1024
	TIMSK0 |= _BV(TOIE0);			// ��� ������������ ����� ������� ���������� overflow interrupt
#else			// ���� ������� ����, ������328/16�
	// 100 - prescaler 64; Foverflow = 16M/64*256 ~=976.56Hz,
	TCCR2B = (1<<CS22) | (1<<CS21) | (1<<CS20) ;  // 111 - CLK/1024, 16M/1024*254 - 1/64 �������
	TIMSK2 |=(1<<TOIE0);  // interrupt ovfl enable
	//Serial.begin(115200);
#endif
}


//.................................... ����������� ����������
//
// ���������� - ������ - ������������ ������� �������������� globalTimer ������ 1/37 �������
#ifdef GIMSK	// ���� ATtiny13
ISR(TIM0_OVF_vect){
	globalTimer++;	// � ������ ������ ��� ������ �� ����. ���������, ����� �������� while(1) ���� � �����.
}
#else
// � ������� ������0 - ����������� ������������ ��� ����������� �����, - ��� ������� �������-����� - ��� ������ ���� �� �2
ISR(TIMER2_OVF_vect){
	globalTimer++;
}
#endif
// ������� ���������� - ������� �� ������ (������, ��������� ���������, ����������� �� ���� 0)
ISR(INT0_vect){
	DISABLE_EXTERNAL_INT0;
	SET_MODE_WAKEUP;		// ���������� ��������� ������ �� ��� POWER DOWN
	globalTimer = 0;		// ����������� - ����� �������
	scan_button_cnt = 0;	// ����� ������� ������
	RES_SHORT_PRESS_FLAG;	//
	RES_LONG_PRESS_FLAG;	// � ������
}

/*
// ��� ������� - ������ ��� ���������� ��������
void inline dbg(){
	DDRB |= YELL0; PORTB ^= YELL0;
}
*/

//uint8_t current_signal __attribute__ ((section (".noinit")));
// uint8_t	current_signal;				// 1 ���� �� ������� ���������, ����� � traffic_signals
//.................................... �������� ���������
//
uint16_t useless_var __attribute__ ((section (".noinit")));

int main() {
	//uint16_t useless_var;
	uint8_t	current_signal;				// 1 ���� �� ������� ���������, ����� � traffic_signals
#pragma region Initialisation&setup
	// ����������� �������� �� ����� "� ����� ���-�������". 
	set_sleep_mode(SLEEP_MODE_IDLE);	//���������� ����� ��� - ��.�������
	sleep_enable();				// ��������� ���� � ���

	init_timer_clock();			// ������������� � ������ ����������� �������

	globalTimer = 0;			// ����������� - ����� �������
	SET_MODE_WORK;				// ���������� ��������� ������� ������
	SET_USE_FIRST_VALUES_LIGHT_FLAG;	//������ ���� ��������
	scan_button_cnt = 0;		// �������� ������� ������
	useless_var = 5;
	// ������ ������ ��� ����� ���������� ������ ��������
	current_signal = LIGHT_NUM_START_SHOW;	// ��������� ������ ������ ������������ - ��������� ������ �������/������������
	SET_FORCE_SET_SIGNAL_FLAG;				// �������� ����� �������� current_signal

	sei();		// ��������� ��������� ��������� ����������

#pragma endregion
	while(1){
		
#pragma region TimerOVF
		// ������������ ����������� �������? 
		if(globalTimer > MAX_GLOBAL_TIMER_VALUE){
			globalTimer -= MAX_GLOBAL_TIMER_VALUE;			// �������� ���������� ������
			// 
			if(tl_flash_end){
				tl_flash_end -= MAX_GLOBAL_TIMER_VALUE;		// �������� ������ �������, ���� ����
				useless_var --;
			}
			if(tl_signal_end){
				tl_signal_end -= MAX_GLOBAL_TIMER_VALUE;	// // �������� ������ ���������, ���� ����
				useless_var ++;
			}
			// setPeriods(currentMode, false); // ��� �� 12 ���� ������, �� tl_.._end ��������� � ��������, ����� ��������� ����������� ���������� ������������
		}
#pragma endregion

#pragma region ButtonState
		//�������� ������� ������
		if(BUTTON_ON){
			if(scan_button_cnt < USHRT_MAX){
				scan_button_cnt++;				// ��� ���� 1/37 ������� ������ ���������� ���� �������
				useless_var-=scan_button_cnt;
			}
			// ����� ������ - ���� ���, ��� �� ���� ����������
			if(scan_button_cnt > PERIOD_PRESS_BUTTON_SHORT){
				SET_SHORT_PRESS_FLAG;		// ������, ������� ��� ������� ��������� �������, ��������
			}
			if(scan_button_cnt > PERIOD_PRESS_BUTTON_LONG){
				SET_LONG_PRESS_FLAG;		// � ���� ������� ������� ��������
			}
		}
#pragma endregion
#pragma region LightWorkLogic
		//���� � ������ ������ ���� ������� (tl_flash_end !=0 )
		if(tl_flash_end){
			// � ����� ����� ������� ������
			if(globalTimer > tl_flash_end){
				FLIP_USE_FIRST_VALUES_LIGHT_FLAG;				// !use_main_values - ��� ��� ���� �� ���� ))
				setPorts(current_signal, IF_USE_FIRST_VALUES_LIGHT_FLAG);		// ����������� ����� �������� ��������� �� ���������������
				setPeriods(current_signal, false);			// �������� ������ ��������� ������ �������, �� �� ���������
			}
		}

		// ���� � ������ ������ ���� ����������� ������� ��������� 
		// - ���������� ��� ������ operating_std ����������� ������������������ �� ����� - �������-������-������� 
		// �� � ��������� ������, ������� ����� +1 ������ ������ 7
		if(tl_signal_end){
			// � ��� ���� ������������ �� c�������� (use_main_values - ����� ������������ ���� � �������� �������� - �� ������)
			if((globalTimer > tl_signal_end)  && IF_USE_FIRST_VALUES_LIGHT_FLAG){
				current_signal ++;							// ��������� ������ ���������
				current_signal &= MASK_LIGHT_NUM_STD;		// �������� ���� ���� 3-��, � �������� ������ ������� ������ ��������� � 0 �� 7
				SET_FORCE_SET_SIGNAL_FLAG;		// �������� ����� �������� current_signal
			}
		}
#pragma endregion

#pragma region MODE_VALUELogic
		// ������ ��������� ������, 2 ���� f_button_state_flags
		//? MODE_VALUE === pwrdown -> wakeup -> work -> tosleep -> pwrdown
		switch (MODE_VALUE){
		case (MODE_WAKEUP_VALUE):
			set_sleep_mode(SLEEP_MODE_IDLE);		// �� �����!
			// ����� �� ��������, ���� ������ �� ������ ���������� ����� - IF_BUTTON_LONG_FLAG
			if(IF_LONG_PRESS_FLAG){
				// � �� �������� �� ��� ������������? ����� �������� ����!
				if(current_signal == LIGHT_NUM_LIGHTS_OFF){
					// ��������� ��� ����� ���������� �������� ��� � ������ ������� ���������? LIGHT_NUM_ERR
					current_signal = (IF_LIGHT_SIGNAL_ALT_MODE_FLAG) ? LIGHT_NUM_YELLOW_FLASH : LIGHT_NUM_STD_START;
					SET_FORCE_SET_SIGNAL_FLAG;		// �������� ����� �������� current_signal
					useless_var |= current_signal;
				}
			}
			//�, ������ ������...
			if(BUTTON_OFF){
				// � ����� ���� ���� ��� �����, ��� �������� ���������
				if(IF_LONG_PRESS_FLAG){
					SET_MODE_WORK;
				}else{	
					// � ��, ���������, ��� ��������� ��������, ����� ������
					SET_MODE_PWRDOWN;	// �� ��������� ����� ���������� ����� ��� � ������
				}
				scan_button_cnt = 0;	// � ����� ������ �������� ������� ������������ �������
				RES_SHORT_PRESS_FLAG;	// � ����� �������, �������
				RES_LONG_PRESS_FLAG;
			}
			break;

		case (MODE_WORK_VALUE):
			// ������ ����������?
			if(scan_button_cnt > 0){
				// ������� �������� �������?
				if(IF_LONG_PRESS_FLAG){
					current_signal = LIGHT_NUM_LIGHTS_OFF;		// ���� ����
					SET_FORCE_SET_SIGNAL_FLAG;					// ������ ������� - ���������� ����� "���� ��������"
					SET_MODE_TOSLEEP;							// ������� ���� �����!
				}
				//������ ���������? 
				if(BUTTON_OFF){
					// ������ ���� ������ ��������� ���������?
					if(IF_SHORT_PRESS_FLAG){
						FLIP_LIGHT_SIGNAL_ALT_MODE_FLAG;	// ������������� ���� ������ ������ ������������
						current_signal = (IF_LIGHT_SIGNAL_ALT_MODE_FLAG) ? LIGHT_NUM_YELLOW_FLASH : LIGHT_NUM_STD_START; // �� ��������� ����� ����. ������
						SET_FORCE_SET_SIGNAL_FLAG;			// ���� ��������� ������ ����� �������� current_signal
					}
					scan_button_cnt=0;
					RES_SHORT_PRESS_FLAG; //����� ������ ������� � ��������
					RES_LONG_PRESS_FLAG;
				}
			}
			break;

		case (MODE_TOSLEEP_VALUE):
			// ����� �� ��������� - ������ �� ������� ������.
			if(BUTTON_OFF){
				SET_MODE_PWRDOWN;		// �� ��������� ����� �����
			}
			break;

		case (MODE_PWRDOWN_VALUE):
			// �! ������ ����, ����������! ������ ������?
			if(BUTTON_ON){
				set_sleep_mode(SLEEP_MODE_IDLE);
				useless_var = 77;
				SET_MODE_WAKEUP;
			}else{	
				// �� ������? ����� ������.
				scan_button_cnt = 0;
				RES_LONG_PRESS_FLAG;
				RES_SHORT_PRESS_FLAG;
				current_signal = LIGHT_NUM_LIGHTS_OFF;		//���� ����
				SET_FORCE_SET_SIGNAL_FLAG;
				set_sleep_mode(SLEEP_MODE_PWR_DOWN);	// ������ ������ ����� - � ����� while(1)
				ENABLE_EXTERNAL_INT0;					// ��������� ���������� �� ������� ������
			}
			break;

		default:
			//! ��� �� ����� ������ �� ��� - ������ ��������� ������ ����. ������ - ����������� ��������� ��� ��������� ���������� ���������
			current_signal = LIGHT_NUM_ERR;
			globalTimer = useless_var;
			SET_FORCE_SET_SIGNAL_FLAG;
			//setPorts(current_signal,true);
			//setPeriods(current_signal,true);
			break;
		}
#pragma endregion

		// ������ ������ ������, ��� ���� ����������� ��������� � �����-�� ������?
		if(IF_FORCE_SET_SIGNAL_FLAG){		// ���� �������������� ��������� ��������� ������������ �� current_signal
			RES_FORCE_SET_SIGNAL_FLAG;		// ����� �����
			SET_USE_FIRST_VALUES_LIGHT_FLAG;	// ����� ����� - �������� � 0-�� �������� ���� ���-����
			setPorts(current_signal, IF_USE_FIRST_VALUES_LIGHT_FLAG);	// ����������� ����� �������� ��������� �� #current_signal � �������
			setPeriods(current_signal, true);
		}
		globalTimer = useless_var - 123;
		// ����� ��� �� 1/37 �������. ���, �����, � ������.
		sleep_cpu();	//� � ����� ����� ������������ �������� ����� - ������ � ���.
	}
}


//.................................... �������
//
// ��������� �������� ����� �
 void setPorts(uint8_t num, bool  use_main_values){
	uint8_t val;
	DDRB = 0; PORTB = 0;
	// ���� �������� ����� (�������) - ddr_val_0, else = ddr_val_1
//	val = (use_main_values) ? pgm_read_byte_near(&(traffic_signals[num].ddr_val_0))
//							: pgm_read_byte_near(&(traffic_signals[num].ddr_val_1));

	// �� �� �����, �� �� ��� �������, ���������� ����������, ������ � ����, ���� �� 14 (!!!) ���� ��� �����.
	val = pgm_read_byte_near(&(traffic_signals[num].ddr_val_0)+( (use_main_values) ? 0 : sizeof(uint8_t)*2 ) ); 

	val &= ~_BV(BUTTON_PIN);	// ����� ���� ���� ������, ��� ������ �������� - ����
	DDRB = val;					// ��������� ������ ����� �����
	
	val = (use_main_values) ? pgm_read_byte_near(&(traffic_signals[num].port_val_0)) 
							: pgm_read_byte_near(&(traffic_signals[num].port_val_1));
	val|= _BV(BUTTON_PIN);	// �������� �� ���� ������ - ������������ - ������������ �� ������ �������
	PORTB = val;		// ��������� �������� ������� � ������ �����
}

 //���������� ����� ��������� ������ ������� (��� ������������ ������ ������ ������������)
void setPeriods(uint8_t num, bool set_both_flash_and_signal){
// ���������� ����������
	tl_flash_end = pgm_read_word_near (&(traffic_signals[num].flash_period));	// ������ �������
	tl_flash_end = (tl_flash_end)? tl_flash_end + globalTimer : 0;	//����� ��������� ������ ������� - ���� �� ������� �������� �������	
	//if(tl_flash_end){ 		tl_flash_end += globalTimer; 	} <- ��� ��� ��� �� 8 ���� �������

	// ���� ���������� ��� ������� - � ��������� � �������
	if(set_both_flash_and_signal){
		tl_signal_end = pgm_read_word_near(&(traffic_signals[num].signal_period));	
		tl_signal_end = (tl_signal_end)? tl_signal_end + globalTimer : 0;			// ����� ������������ �� ��������� �����, ���� �� ������� ��������
	}
}

//Program size: 976 bytes (used 95% of a 1�024 byte maximum) (1,59 secs)
//Minimum Memory Usage: 8 bytes (13% of a 64 byte maximum)
