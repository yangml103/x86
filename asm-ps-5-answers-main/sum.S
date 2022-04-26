

.intel_syntax noprefix
	.section .text
	.global SUM_function

SUM_function: 
	
	add rax,qword ptr [rdi]
	cmp qword ptr [rdi], 0
	jg POSITIVE
	mov rcx, qword ptr [SUM_NEGATIVE]
	add rcx, qword ptr [rdi]
	mov qword ptr [SUM_NEGATIVE], rcx

	ret

POSITIVE:
    mov rcx, qword ptr [SUM_POSITIVE]
    add rcx, qword ptr [rdi]
    mov qword ptr [SUM_POSITIVE], rcx

    ret
    
    
.data
.global SUM_POSITIVE
.global SUM_NEGATIVE

SUM_POSITIVE:
    .quad 0x0
    
SUM_NEGATIVE:
    .quad 0x0

