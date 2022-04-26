

	.intel_syntax noprefix
	.section .text
	.global UPPER_function

UPPER_function:

   
    mov rsi, QWORD PTR [rdi]

    
CHECKER:

    cmp BYTE PTR [rsi], 0
    je QUIT
    inc rax
    cmp BYTE PTR [rsi], 'a'
    jge LOWER
    inc rsi
    jmp CHECKER
    
LOWER:
    cmp BYTE PTR [rsi], 'z'
    jle CONVERT
    inc rsi 
    jmp CHECKER
    
CONVERT:
    mov dl, BYTE PTR [rsi]
    sub dl, 'a'-'A'
    mov BYTE PTR [rsi], dl
    inc rsi
    jmp CHECKER
    
    
QUIT:
    ret

