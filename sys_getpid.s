BITS 64

extern printf

global _getpid


section .rodata
	pid db "PID => %d", 10, 0

section .text


_getpid:
	mov rax, 39
	syscall
	push rax
	jmp _print_pid

_print_pid:
	mov rdi, pid
	pop rax
	mov rsi, rax
	call printf 
	jmp _exit
	

_exit:
	mov rax, 0x3C
	mov rdi, 0
	syscall

	
