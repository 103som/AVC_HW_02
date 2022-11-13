	.intel_syntax noprefix                                        # Используем синтаксис в стиле Intel. 
	.text                                                         # Начало секции.
	.globl	hex_digit                                             # Объявляем и экспортируем hex_digit.
	.type	hex_digit, @function                                  # Отмечаем, что это функция.
hex_digit:
	push	rbp					              # Стандартный пролог функции(заталкивает rbp на стек).
	mov	rbp, rsp                  			      # Стандартный пролог функции(копирование переданного значения rsp в rbp).
	
	# Загрузка параметров в стек.
	mov	DWORD PTR -4[rbp], edi                                # (int code)
	
	# Конструкция if else.
	cmp	DWORD PTR -4[rbp], 9                                  # Сравнение (code < 10).
	jg	.L2                                                   # Переход к метке .L2 (команда: ('a' + code - 10;)).
	add	DWORD PTR -4[rbp], 48                                 # Выполнение сложения ('0' + code), '0' в Dec ASCII равен 48.
	jmp	.L3                                                   # Переход к метке .L3 (там происходит присваивание посчитанного значения в code, возврат функции).
.L2:
	add	DWORD PTR -4[rbp], 87                                 # Выполнение сложения ('a' + code - 10), ('a' - 10) в Dec ASCII равно 87.;
.L3:
	mov	eax, DWORD PTR -4[rbp]                                # Присвоение посчитанного значения переменной code. (mod копирует данные из операнда-источника в операнд-получатель).
	pop	rbp                                                   # Выгружает (int code) из стека(т.к. при выходе из функции происходит удаление локально созданной переменной).
	ret                                                           # Возврат значения.
	
	.size	hex_digit, .-hex_digit                                # Загружаем hex_digit.
	.globl	changeVowelesToASCII                                  # Объявляем и экспортируем changeVowelesToASCII.
	.type	changeVowelesToASCII, @function                       # Отмечаем, что это функция.
changeVowelesToASCII:
	push	rbp					              # Стандартный пролог функции (заталкивает rbp на стек).
	mov	rbp, rsp					      # Стандартный пролог функции (копирование переданного значения rsp в rbp).
	push	rbx                                                   # Стандартный пролог функции (заталкивает rbx на стек).
	sub	rsp, 48                                               # Конец пролога функции(выделяем 48 байт на стеке).
	
	# 12 - cnt
	# 16 - i
	# 32 - str
	# 40 - strASCII16
	# 44 - n
	# 56 - newSize
	
	# Загрузка параметров в стек.
	mov	QWORD PTR -32[rbp], rdi                               # str 
	mov	QWORD PTR -40[rbp], rsi                               # strASCII16
	mov	DWORD PTR -44[rbp], edx                               # n
	mov	QWORD PTR -56[rbp], rcx                               # newSize
	mov	DWORD PTR -12[rbp], 0                                 # cnt = 0
	mov	DWORD PTR -16[rbp], 0                                 # i = 0
	
	jmp	.L6                                                   # Переход к метке L6 (условию цикла).
.L9:
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := *str.
	add	rax, rdx                                              # Выполнение сложения (*str + i), получаем str[i].
	movzx	eax, BYTE PTR [rax]                                   # str[i].
	cmp	al, 97                                                # Сравнение str[i] и 'a', код 'a' в Dec ASCII равен 97.
	je	.L7                                                   # Если не выполнено (str[i] != 'a'), то переходим к метке L7(не попадаем внутрь if).
	
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := *str.
	add	rax, rdx                                              # Выполнение сложения (*str + i), получаем str[i].
	movzx	eax, BYTE PTR [rax]                                   # str[i].
	cmp	al, 101                                               # Сравнение str[i] и 'e', код 'e' в Dec ASCII равен 101.
	je	.L7                                                   # Если не выполнено (str[i] != 'e'), то переходим к метке L7(не попадаем внутрь if).
	
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := *str.
	add	rax, rdx                                              # Выполнение сложения (*str + i), получаем str[i].
	movzx	eax, BYTE PTR [rax]                                   # str[i].
	cmp	al, 105                                               # Сравнение str[i] и 'i', код 'i' в Dec ASCII равен 105.
	je	.L7                                                   # Если не выполнено (str[i] != 'i'), то переходим к метке L7(не попадаем внутрь if).
	
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := *str.
	add	rax, rdx                                              # Выполнение сложения (*str + i), получаем str[i].
	movzx	eax, BYTE PTR [rax]                                   # str[i].
	cmp	al, 111                                               # Сравнение str[i] и 'o', код 'o' в Dec ASCII равен 111.
	je	.L7                                                   # Если не выполнено (str[i] != 'o'), то переходим к метке L7(не попадаем внутрь if).
	
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := *str.
	add	rax, rdx                                              # Выполнение сложения (*str + i), получаем str[i]. 
	movzx	eax, BYTE PTR [rax]                                   # str[i].
	cmp	al, 117                                               # Сравнение str[i] и 'u', код 'u' в Dec ASCII равен 117.
	je	.L7                                                   # Если не выполнено (str[i] != 'u'), то переходим к метке L7(не попадаем внутрь if).
	
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := *str.
	add	rax, rdx                                              # Выполнение сложения (*str + i), получаем str[i].
	movzx	eax, BYTE PTR [rax]                                   # str[i].
	cmp	al, 121                                               # Сравнение str[i] и 'y', код 'y' в Dec ASCII равен 121.
	je	.L7                                                   # Если не выполнено (str[i] != 'y'), то переходим к метке L7(не попадаем внутрь if).
	
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := *str.
	add	rax, rdx                                              # Выполнение сложения (*str + i), получаем str[i].
	movzx	eax, BYTE PTR [rax]                                   # str[i].
	cmp	al, 65                                                # Сравнение str[i] и 'A', код 'A' в Dec ASCII равен 65.
	je	.L7                                                   # Если не выполнено (str[i] != 'A'), то переходим к метке L7(не попадаем внутрь if).
	
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := *str.
	add	rax, rdx                                              # Выполнение сложения (*str + i), получаем str[i].
	movzx	eax, BYTE PTR [rax]                                   # str[i].
	cmp	al, 69                                                # Сравнение str[i] и 'E', код 'E' в Dec ASCII равен 69.
	je	.L7                                                   # Если не выполнено (str[i] != 'E'), то переходим к метке L7(не попадаем внутрь if).
	
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := *str.
	add	rax, rdx                                              # Выполнение сложения (*str + i), получаем str[i].
	movzx	eax, BYTE PTR [rax]                                   # str[i].
	cmp	al, 73                                                # Сравнение str[i] и 'I', код 'I' в Dec ASCII равен 73.
	je	.L7                                                   # Если не выполнено (str[i] != 'I'), то переходим к метке L7(не попадаем внутрь if).
	
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := *str.
	add	rax, rdx                                              # Выполнение сложения (*str + i), получаем str[i].
	movzx	eax, BYTE PTR [rax]                                   # str[i].
	cmp	al, 79                                                # Сравнение str[i] и 'O', код 'O' в Dec ASCII равен 79.
	je	.L7                                                   # Если не выполнено (str[i] != 'O'), то переходим к метке L7(не попадаем внутрь if).
	
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := *str.
	add	rax, rdx                                              # Выполнение сложения (*str + i), получаем str[i].
	movzx	eax, BYTE PTR [rax]                                   # str[i].
	cmp	al, 85                                                # Сравнение str[i] и 'U', код 'U' в Dec ASCII равен 85.
	je	.L7                                                   # Если не выполнено (str[i] != 'U'), то переходим к метке L7(не попадаем внутрь if).
	
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := *str.
	add	rax, rdx                                              # Выполнение сложения (*str + i), получаем str[i].
	movzx	eax, BYTE PTR [rax]                                   # str[i].
	cmp	al, 89                                                # Сравнение str[i] и 'Y', код 'Y' в Dec ASCII равен 89.
	je	.L7                                                   # Если не выполнено (str[i] != 'Y'), то переходим к метке L7(не попадаем внутрь if).
	
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := *str.
	add	rax, rdx                                              # Выполнение сложения (*str + i), получаем str[i].
	mov	edx, DWORD PTR -12[rbp]                               # str[i].
	
	movsx	rcx, edx                                              # rcx := edx.
	
	mov	rdx, QWORD PTR -40[rbp]                               # Выполнение сложения (*strASCII + i), получаем str[i].
	add	rdx, rcx                                              # strASCII[i].
	
	# Выполнение (strASCII16[cnt] = str[i]).
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR [rdx], al            
	                
	add	DWORD PTR -12[rbp], 1                                 # Увеличение cnt на 1 (++cnt).
	jmp	.L8                                                   # Переход к метке L8 (continue).
.L7:
	# Выполнение строчки кода (strASCII[cnt] = '0');.
	mov	eax, DWORD PTR -12[rbp]                               # Перемещаем rbp - 12 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -40[rbp]                               # rax := *strASCII16.
	add	rax, rdx                                              # Выполнение сложения (*strASCII + i), получаем strASCII[i].
	mov	BYTE PTR [rax], 48                                    # Выполняем (strASCII[cnt] = '0').
	
	# Выполнение строчки кода (strASCII[cnt + 1] = 'x').
	mov	eax, DWORD PTR -12[rbp]                               # Перемещаем rbp - 12 в eax (i).
	lea	rdx, 1[rax]                                           # задаем (i).
	mov	rax, QWORD PTR -40[rbp]                               # rax := *strASCII.
	add	rax, rdx                                              # Выполнение сложения (*strASCII + i), получаем strASCII[i].
	mov	BYTE PTR [rax], 120                                   # Выполняем (strASCII[cnt] = 'x').
	
	# Выполнение строчки кода (strASCII[cnt + 2] = hex_digit(str[i] / 16)).
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]                                   # Складываем, получая strASCII[cnt + 3].
	lea	edx, 15[rax]                                          # Для последующего деления на 16.
	test	al, al
	cmovs	eax, edx                                              # Складываем, получая str[i].
	sar	al, 4
	movsx	eax, al
	mov	edx, DWORD PTR -12[rbp]
	movsx	rdx, edx
	lea	rcx, 2[rdx]
	mov	rdx, QWORD PTR -40[rbp]
	lea	rbx, [rcx+rdx]
	mov	edi, eax                                              # edi := eax.
	call	hex_digit                                             # Вызов hex_digit.
	mov	BYTE PTR [rbx], al                                    # Выполняем (strASCII[cnt + 2] = hex_digit(str[i] / 16)).
	
	# Выполнение строчки кода (strASCII[cnt + 3] = hex_digit(str[i] % 16)).
	mov	eax, DWORD PTR -16[rbp]                               # Перемещаем rbp - 16 в eax (i).
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx                                              # Складываем, получая strASCII[cnt + 3].
	movzx	eax, BYTE PTR [rax]
	mov	edx, eax
	sar	dl, 7
	shr	dl, 4
	add	eax, edx                                              # Складываем, получая str[i].
	and	eax, 15                                               # str[i] % 16.
	sub	eax, edx
	movsx	eax, al
	mov	edx, DWORD PTR -12[rbp]
	movsx	rdx, edx
	lea	rcx, 3[rdx]
	mov	rdx, QWORD PTR -40[rbp]
	lea	rbx, [rcx+rdx]
	mov	edi, eax                                              # edi := eax.
	call	hex_digit                                             # Вызов hex_digit.
	mov	BYTE PTR [rbx], al                                    # Выполняем (strASCII[cnt + 2] = hex_digit(str[i] / 16)).
	
	add	DWORD PTR -12[rbp], 4                                 # Увеличение cnt на 4 (cnt += 4).
.L8:
	add	DWORD PTR -16[rbp], 1                                 # Увеличение i (++i).
.L6:
	mov	eax, DWORD PTR -16[rbp]                               # Загрузка n из стека в регистр.
	cmp	eax, DWORD PTR -44[rbp]                               # Сравнение i и n.
	jl	.L9                                                   # Если выполнено условие (i < n), то переходим в метке L9(циклу).
	
	mov	rax, QWORD PTR -56[rbp]                               # rax = rbp - 56.
	mov	edx, DWORD PTR -12[rbp]                               # edx = rbp - 12.
	mov	DWORD PTR [rax], edx                                  # (*newSize = cnt).
	
	# Выход из функции.
	nop
	mov	rbx, QWORD PTR -8[rbp]                                # rbx = rbp - 8.
	leave
	ret
	
	.type	printArr, @function                                   # Отмечаем, что это функция.
printArr:
	# Пролог функции, выделяем 48 байт на стеке.
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	
	# 4 - i
	# 24 - out
	# 32 - str
	# 36 - n
	
	# Загрузка параметров в стек.
	mov	QWORD PTR -24[rbp], rdi                               # out
	mov	QWORD PTR -32[rbp], rsi                               # str
	mov	DWORD PTR -36[rbp], edx                               # n
	mov	DWORD PTR -4[rbp], 0                                  # i = 0
	jmp	.L11                                                  # Переход к метке L11 по коду (к условию цикла).
.L12:
	mov	eax, DWORD PTR -4[rbp]                                # eax = i.
	movsx	rdx, eax                                              # rdx := eax. (i)
	mov	rax, QWORD PTR -32[rbp]                               # 3 аргумент str[i] (для fprintf).
	add	rax, rdx                                              # (*str + i), то есть для получения str[i].
	movzx	eax, BYTE PTR [rax]                                   # str[i]
	movsx	eax, al                                               # копирует все (str[i]) в eax.
	mov	rdx, QWORD PTR -24[rbp]                               # 1 аргумент out "output.txt" (для fprintf).
	mov	rsi, rdx                                              # rsi := rdx.
	mov	edi, eax                                              # edi := eax.
	call	fputc@PLT                                             # Вызов функции fprintf.
	add	DWORD PTR -4[rbp], 1                                  # Увеличение i (++i).
.L11:
	mov	eax, DWORD PTR -4[rbp]                                # Загрузка n из стека в регистр.
	cmp	eax, DWORD PTR -36[rbp]                               # Сравниваем i и n (i < n).
	jl	.L12                                                  # Если i < n, то переходим к циклу.
	
	# Если нарушено условие, то выходим из функции.
	nop
	nop
	leave
	ret
.LC0:
	.string	"%c"                                                  # Экспортируем "%c".
	.text                                                         # Начало секции.
	.type	fillArr, @function                                    # Отмечаем, что это функция.
fillArr:
	# Пролог функции, выделяем 48 байт на стеке.
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	
	# 4 - i
	# 24 - in
	# 32 - str
	# 40 - n
	
	# Загрузка параметров в стек.
	mov	QWORD PTR -24[rbp], rdi                               # in
	mov	QWORD PTR -32[rbp], rsi                               # str
	mov	QWORD PTR -40[rbp], rdx                               # n
	mov	DWORD PTR -4[rbp], 0                                  # i
	jmp	.L14                                                  # Переход к условию цикла.
.L17:
	lea	rdx, -5[rbp]                                          # Перемещение rbp - 5[rbp] в rdx.
	mov	rax, QWORD PTR -24[rbp]                               # 1 аргумент in "input.txt" (для fscanf).
	lea	rcx, .LC0[rip]                                        # 2 аргумент "%c" в rcx (для fscanf). 
	mov	rsi, rcx                                              # rsi := rcs.
	mov	rdi, rax                                              # rdi := rax.
	mov	eax, 0                                                # eax := 0.
	call	__isoc99_fscanf@PLT                                   # Вызов функции fscanf.
	cmp	eax, -1                                               # Сравнение (fscanf(in, "%c", &curChar) и -1).
	je	.L15                                                  # Если (fscanf(in, "%c", &curChar) == -1), то переход к L15 (break).
	movzx	eax, BYTE PTR -5[rbp]                                 # str[i].
	test	al, al                                                # Сравниваем (curChar и '\0').
	je	.L15                                                  # Если (curChar == '\0'), то переход к L15 (break).
	movzx	eax, BYTE PTR -5[rbp]                                 # str[i].
	cmp	al, 10                                                # Сравниваем (curChar и '\n').
	jne	.L16                                                  # Если (curChar != '\n'), то переход к L16.
	jmp	.L14
.L16:
	mov	eax, DWORD PTR -4[rbp]                                # Загрузка eax из стека в регистр.
	movsx	rdx, eax                                              # rdx := eax (i).
	mov	rax, QWORD PTR -32[rbp]                               # rax := str[i].
	add	rdx, rax                                              # rdx := rax.
	movzx	eax, BYTE PTR -5[rbp]                                 # str[i].
	mov	BYTE PTR [rdx], al                                    # Сдвиг.
	add	DWORD PTR -4[rbp], 1                                  # ++i.
.L14:
	cmp	DWORD PTR -4[rbp], 999                                # Сравнение i и 1000, (i < 1000).
	jle	.L17                                                  # Если i < 1000, то переходим к циклу.
.L15:
	mov	rax, QWORD PTR -40[rbp]                               # rax := str[i].
	mov	edx, DWORD PTR -4[rbp]                                # Загрузка edx из стека в регистр. 
	mov	DWORD PTR [rax], edx                                  # Сдвиг.
	
	# Выходим из функции.
	nop
	leave
	ret
.LC1:
	.string	"r"                                                   # Загружаем "r".
.LC2:
	.string	"input.txt"                                           # Загружаем "input.txt".
.LC3:
	.string	"w"                                                   # Загружаем "w".
.LC4:
	.string	"output.txt"                                          # Загружаем "output.txt".
	.text                                                         # Начало секции.
	.globl	main                                                  # Объявляем и экспортируем main.
	.type	main, @function                                       # Отмечаем, что это функция.
main:
	# Пролог функции, выделяем память на стеке.
	push	rbp
	mov	rbp, rsp
	lea	r11, -49152[rsp]
.LPSRL0:
	# Процессы по выделению памяти.
	sub	rsp, 4096                                             
	or	DWORD PTR [rsp], 0                                    
	cmp	rsp, r11                                              
	jne	.LPSRL0                                               
	sub	rsp, 880                                              
	mov	DWORD PTR -50020[rbp], 0                              # (int n = 0;). 
	
	lea	rax, .LC1[rip]                                        # Загружаем LC1("r") для fopen.
	mov	rsi, rax                                              # rsi := rax.
	lea	rax, .LC2[rip]                                        # Загружаем LC2("input.txt") для fopen.
	mov	rdi, rax                                              # rdi := rax.
	call	fopen@PLT                                             # Вызов fopen.
	mov	QWORD PTR -8[rbp], rax                                # Заполняем in (in = fopen()).
	
	lea	rax, .LC3[rip]                                        # Загружаем LC3("w") для fopen.
	mov	rsi, rax                                              # rsi := rax.
	lea	rax, .LC4[rip]                                        # Загружаем LC4("output.txt") для fopen.
	mov	rdi, rax                                              # rdi := rax.
	call	fopen@PLT                                             # Вызов fopen.
	mov	QWORD PTR -16[rbp], rax                               # Заполняем out (out = fopen()).
	
	lea	rdx, -50020[rbp]                                      # Выгружаем strASCII16 в rdx.
	lea	rcx, -10016[rbp]                                      # Выгружаем str в rcx.
	mov	rax, QWORD PTR -8[rbp]                                # Выгружаем n в rax.
	mov	rsi, rcx                                              # rsi := rcx.
	mov	rdi, rax                                              # rdi := rax.
	call	fillArr                                               # Вызов fillArr.
	
	mov	DWORD PTR -50024[rbp], 0                              # (int newSize = 0;).
	mov	edx, DWORD PTR -50020[rbp]
	
	# Выгружаем: (str, strASCII16, n) для функции changeVowelesToASCII.
	lea	rcx, -50024[rbp]                                      
	lea	rsi, -50016[rbp]                                      
	lea	rax, -10016[rbp]                                    
	mov	rdi, rax                                              # rdi := rax.
	call	changeVowelesToASCII                                  # Вызов changeVowelesToASCII.
	
	mov	edx, DWORD PTR -50024[rbp]                            # newSize
	lea	rcx, -50016[rbp]                                      # Выгружаем strASCII16.
	mov	rax, QWORD PTR -16[rbp]                               # out.
	mov	rsi, rcx                                              # rsi := rcx.
	mov	rdi, rax                                              # rdi := rax;
	call	printArr                                              # Вызов printArr.
	
	# Завершение программы.
	mov	eax, 0                                                # return 0.
	leave
	ret
