#include <stdio.h>

// Получение 16 ричного кода символа.
char hex_digit(int code) 
{
    if (code < 10)
        code = '0' + code;
    else
        code = 'a' + code - 10;
    
    return code;
}

// Замена гласных на ASCII код (0xDD).
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

// Вывод массива в текстовый файл.
static void printArr(FILE *out, char *str, int n)
{
    for (int i = 0; i < n; ++i)
    {
        fprintf(out, "%c", str[i]);
    }
}

// Ввод массива с текстового файла.
static void fillArr(FILE *in, char *str, int *n)
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

int main()
{
    // Создание исходного массива char, ограничение в 10000 символов.
    char str[10000];
    
    // Создание ASCII массива char, ограничение в 40000 символов(т.к. максимум : 10000 * 4, т.к. символ имеет кодировку 0xDD).    
    char strASCII16[40000];
    int n = 0;
    
    // Файл с входными данными.
    FILE *in = fopen("input.txt", "r");
    
    // Файл с выходными данными.
    FILE *out = fopen("output.txt", "w");
    
    // Ввод исходного масива символов.
    fillArr(in, str, &n);
    
    int newSize = 0;
    changeVowelesToASCII(str, strASCII16, n, &newSize);
    
    // Вывод полученного результата.
    printArr(out, strASCII16, newSize);
}
    return 0;
}

