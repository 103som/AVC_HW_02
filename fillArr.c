#include <stdio.h>

void fillArr(FILE *in, char *str, int *n)
{
    char curChar;
    int i = 0;
    for (; i < 1000;)
    {
        if (fscanf(in, "%c", &curChar) == -1 || curChar == '\0')
            break;
            
        if (curChar == '\n')
            continue;
            
        str[i] = curChar;
        ++i;
    }
    
    *n = i;
}
