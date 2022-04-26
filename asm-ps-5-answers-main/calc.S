

	.intel_syntax noprefix	
	.section .text 
	.global _start
    
_start:
	xor rax, rax #initialise rax = 0, rax = sum
	xor rdi, rdi #initialise rdi = 0

	#assume rbx has length of array

	mov rdi, OFFSET CALC_DATA_BEGIN
loop_s:
	cmp BYTE PTR[rdi], '&'
	jne or_case
    addq rdi,8
    call AND_function
    addq rdi,8
    jmp loop_s

or_case:
	cmp BYTE PTR[rdi], '|'
    jne sum_case
    addq rdi,8
	call OR_function
    addq rdi,8
    jmp loop_s

sum_case:

	cmp BYTE PTR[rdi], 'S'
    jne arraysum_case
    addq rdi,8
	call SUM_function
    addq rdi,8
    jmp loop_s


arraysum_case:


	cmp BYTE PTR[rdi], 'a'
    jne listsum_case
    addq rdi,8
	call ARRAY_function
    addq rdi,8
    jmp loop_s
    
listsum_case:
	cmp BYTE PTR[rdi], 'l'
    jne upper_case
    addq rdi,8
	call LISTSUM
    addq rdi,8
    jmp loop_s


upper_case:
	cmp BYTE PTR[rdi], 'U'
    jne print_result
    addq rdi,8
	call UPPER_function
    addq rdi,8
    jmp loop_s


print_result:

    mov QWORD PTR [rax_value], rax
    mov rax, 1 # sys write
	mov rdi, 1
    mov rsi, OFFSET rax_value  # pointer whatever we want to write
    mov rdx, 8  # length
    syscall
    
    
	mov rax, 1 # sys write
	mov rdi, 1
    mov rsi, OFFSET SUM_POSITIVE  # pointer whatever we want to write
    mov rdx, 8  # length
    syscall
    
    mov rax, 1 # sys write
	mov rdi, 1
    mov rsi, OFFSET SUM_NEGATIVE  # pointer whatever we want to write
    mov rdx, 8  # length
    syscall
    
    mov rax, 1 # sys write
	mov rdi, 1
    mov rsi, OFFSET CALC_DATA_BEGIN  # pointer whatever we want to write
    
    mov rdx, OFFSET CALC_DATA_END  # length
    mov rcx, OFFSET CALC_DATA_BEGIN 
    subq rdx, rcx
    
    syscall
    
    mov rax, 60 # sys_exit
    mov rdi, 0  # exit length
	syscall


.data

.extern CALC_DATA_BEGIN
.extern CALC_DATA_END
.extern SUM_POSITIVE
.extern SUM_NEGATIVE

rax_value:
    .quad 0x0
