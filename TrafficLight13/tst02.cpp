#include <stdio.h>
int main() {
    char str[4];

    for (size_t i=0; i<sizeof(str); i++) {
        str[i] = '0' + i;
    }
    //printf("%c", str[sizeof(str)-1]);
    return 0;
}

//Program:     288 bytes (28.1% Full) str[100]; 
// Program:     114 bytes (11.1% Full)   str[100]; + //printf

// Program:     286 bytes (27.9% Full)   str[50];
// Program:     112 bytes (10.9% Full)   str[50]; + //printf

//Program:     286 bytes (27.9% Full) str[8]; 
//Program:     112 bytes (10.9% Full) str[8]; + //printf

//Program:     284 bytes (27.7% Full) str[500]; 
//Program:     110 bytes (10.7% Full) str[500]; + //printf

//Program:     286 bytes (27.9% Full) str[4]; 
//Program:     110 bytes (10.7% Full) str[4]; + //printf