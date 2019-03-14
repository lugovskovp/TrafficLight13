#include <stdio.h>
char str[100];

int main() {
    for (size_t i=0; i<sizeof(str); i++) {
        str[i] = '0' + i;
    }
    //printf("%c", str[sizeof(str)-1]);
    return 0;
}

//Program:     274 bytes (26.8% Full)
//(.text + .data + .bootloader)

//Data:        106 bytes (165.6% Full)
//(.data + .bss + .noinit)


//Program:     122 bytes (11.9% Full)