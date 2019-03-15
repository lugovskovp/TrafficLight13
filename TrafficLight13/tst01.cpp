#include <stdio.h>
char str[4];

int main() {
    for (size_t i=0; i<sizeof(str); i++) {
        str[i] = '0' + i;
    }
    printf("%c", str[sizeof(str)-1]);
    return 0;
}

//Program:     274 bytes (26.8% Full) str[100];
//Program:     122 bytes (11.9% Full) str[100]; + //printf

//Program:     272 bytes (26.6% Full) str[50]; 
//Program:     120 bytes (11.7% Full) str[50]; + //printf

//Program:     272 bytes (26.6% Full) str[8]; 
//Program:     120 bytes (11.7% Full) str[8]; + //printf

//Program:     274 bytes (26.8% Full) str[500]; 
//Program:     122 bytes (11.9% Full) str[500]; + //printf

//Program:     272 bytes (26.6% Full) str[4];
//Program:     120 bytes (11.7% Full)  str[4]; + //printf
