

	.intel_syntax noprefix
	.section .text
	.global LISTSUM

LISTSUM:

    mov rbx, QWORD PTR [rdi]
    cmp QWORD PTR [rbx],0
    jne I1
	ret

I1:

    call SUM_function
    add rbx, 8
    mov rbx, QWORD PTR [rbx]
    cmp QWORD PTR [rdi],0
    jne loop_end
	jmp I1
    
loop_end:
    ret