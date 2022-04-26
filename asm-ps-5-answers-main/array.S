

	.intel_syntax noprefix
	.section .text
	.global ARRAY_function

ARRAY_function:

    mov rbx, QWORD PTR [rdi] #rbx will hold the length of the array
    xor r8, r8 # holds counter
    
loop_array:

    addq rdi, 8
    call SUM_function
    addq r8, 1
    cmp r8, rbx
    jne loop_array
	ret
    

    