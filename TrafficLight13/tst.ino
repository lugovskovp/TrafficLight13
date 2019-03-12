#include <avr/io.h>  
//uint8_t cnt;	//global, .bss
//uint16_t cnt __attribute__ ((section (".noinit")));  //.noinit
int main(){
	uint16_t cnt;	//local
    cnt=0;      // < setup()
    while(1){
        cnt++;  // < loop()
    }
}


//uint8_t Program:      78 bytes (7.6% Full) - global
//uint8_t Program:      62 bytes (6.1% Full) - noinit
//uint8_t Program:      58 bytes (5.7% Full) - local


// uint16_t noinit Program:      74 bytes (7.2% Full)
// uint16_t local  Program:      64 bytes (6.3% Full)

//"C:\Users\...\Documents\Arduino\TrafficLight13\gcc\0_MAKE & asm-O0.cmd" $(FULL_CURRENT_PATH)
// add uint16_t vars check for ROM paying
