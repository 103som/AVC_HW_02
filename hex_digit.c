#include <stdio.h>

char hex_digit(int code) 
{
    if (code < 10)
        code = '0' + code;
    else
        code = 'a' + code - 10;
    
    return code;
}
