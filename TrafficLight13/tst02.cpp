#include <stdio.h>
int main() {
    char str[100];

    for (size_t i=0; i<sizeof(str); i++) {
        str[i] = '0' + i;
    }
    //printf("%c", str[sizeof(str)-1]);
    return 0;
}

//Program:     288 bytes (28.1% Full)
//(.text + .data + .bootloader)

//Data:          6 bytes (9.4% Full)
//(.data + .bss + .noinit)

//Program:     114 bytes (11.1% Full)
