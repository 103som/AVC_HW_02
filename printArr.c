#include <stdio.h>

void printArr(FILE *out, char *str, int n)
{
    for (int i = 0; i < n; ++i)
    {
        fprintf(out, "%c", str[i]);
    }
}
