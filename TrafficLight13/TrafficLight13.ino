#include <avr/io.h>			// Для компиляции не из IDE - определения регистров
#include <avr/sleep.h>		// Да, будем спать
#include <avr/interrupt.h>	        // будет использоваться прерывание

volatile uint16_t  globalTimer;		//трачу два байта оперативки из 64 на глобальный таймер

// часики - переполнение таймера инкрементирует globalTimer каждые 1/37 секунды
ISR(TIM0_OVF_vect){
	globalTimer++;	// а больше ничего тут делать не надо. Проснется, сплюсует, пробежит while(1) цикл и уснет.
}

int main() {
	// Планировщик работает по схеме "а потом спи-отдыхай". 
	set_sleep_mode(SLEEP_MODE_IDLE);	//установить режим сна - см.даташит
	sleep_enable();					// разрешаем уход в сон
	TCCR0B = _BV(CS02) | _BV(CS00); // Тактирование таймера0 - clock frequency / 1024
	TIMSK0 |= _BV(TOIE0);			// При переполнении будет вызвано прерывание overflow interrupt
	sei();							// Глобально разрешаем обработку прерываний
	while(1){
		//......... действия основного цикла
		sleep_cpu();	//и в самом конце цикла - уходим в сон.
	}
}

//Program size: 128 bytes (used 13% of a 1 024 byte maximum) (0,86 secs)
//Minimum Memory Usage: 2 bytes (3% of a 64 byte maximum)