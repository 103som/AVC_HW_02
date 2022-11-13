#include <stdio.h>

char hex_digit(int code);

void changeVowelesToASCII(char *str, char *strASCII16, int n, int *newSize)
{
    int cnt = 0;
    for (int i = 0; i < n; ++i)
    {
        if (str[i] != 'a' && str[i] != 'e' && str[i] != 'i' && str[i] != 'o' && str[i] != 'u' && str[i] != 'y'
         && str[i] != 'A' && str[i] != 'E' && str[i] != 'I' && str[i] != 'O' && str[i] != 'U' && str[i] != 'Y')
         {
            strASCII16[cnt] = str[i];
            ++cnt;
         
            continue;
        }   

        strASCII16[cnt] = '0';
        strASCII16[cnt + 1] = 'x';
        strASCII16[cnt + 2] = hex_digit(str[i] / 16);
        strASCII16[cnt + 3] = hex_digit(str[i] % 16);
        
        cnt += 4;
    }
    
    *newSize = cnt;
}
