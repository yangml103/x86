


	.intel_syntax noprefix
	.section .text
	.global OR_function

OR_function:
	or rax,qword ptr [rdi]
	
	ret

