
#include <stdint.h>

uint8_t cnt;	//global, .bss
//uint8_t cnt __attribute__ ((section (".noinit")));  //.noinit

int main(void){
	//uint8_t cnt;	//local
    cnt=0;      // < setup()
    while(1){
        cnt++;  // < loop()
    }
}

//Notepad++ F5 (меню Запуск-Запуск)
//"C:\Users\...\Documents\Arduino\TrafficLight13\gcc\0_MAKE & asm-O0.cmd" $(FULL_CURRENT_PATH)
//Program:      58 bytes (5.7% Full) - local
//Program:      62 bytes (6.1% Full) - noinit
//Program:      78 bytes (7.6% Full) - global



//"C:\Users\...\Documents\Arduino\TrafficLight13\gcc\0_MAKE & asm-O0.cmd" $(FULL_CURRENT_PATH)
//ATMega328
// Program:     152 bytes (0.5% Full)  - local
// Program:     156 bytes (0.5% Full)  - noinit
// Program:     172 bytes (0.5% Full)  - global


//ARM cortex-m3
// - global
//  text    data     bss     dec     hex filename
 //  1116    1092      68    2276     8e4 ./Release/tst-arm.elf

 //- noinit
//   text    data     bss     dec     hex filename
//   1116    1093      64    2273     8e1 ./Release/tst-arm.elf

//- local
//   text    data     bss     dec     hex filename
//   1108    1092      64    2264     8d8 ./Release/tst-arm.elf