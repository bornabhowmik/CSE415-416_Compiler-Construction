	.file	"sum_of_fast_n_numbers.c"
	.intel_syntax noprefix
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Enter a positive number: \0"
.LC1:
	.ascii "%d\0"
	.align 8
.LC2:
	.ascii "Sum of first %d numbers is %d\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
	mov	DWORD PTR -4[rbp], 0
	lea	rax, .LC0[rip]
	mov	rcx, rax
	call	printf
	lea	rax, -12[rbp]
	mov	rdx, rax
	lea	rax, .LC1[rip]
	mov	rcx, rax
	call	scanf
	mov	DWORD PTR -8[rbp], 1
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -8[rbp]
	add	DWORD PTR -4[rbp], eax
	add	DWORD PTR -8[rbp], 1
.L2:
	mov	eax, DWORD PTR -12[rbp]
	cmp	DWORD PTR -8[rbp], eax
	jle	.L3
	mov	eax, DWORD PTR -12[rbp]
	mov	edx, DWORD PTR -4[rbp]
	mov	r8d, edx
	mov	edx, eax
	lea	rax, .LC2[rip]
	mov	rcx, rax
	call	printf
	mov	eax, 0
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 13.3.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
