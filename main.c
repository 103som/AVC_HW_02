#include <stdio.h>

char hex_digit(int code);

void changeVowelesToASCII(char *str, char *strASCII16, int n, int *newSize);

void printArr(FILE *out, char *str, int n);

void fillArr(FILE *in, char *str, int *n);


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
