
	.intel_syntax noprefix
	.section .text
	.global AND_function

AND_function:
	and rax,QWORD PTR [rdi]

	ret
