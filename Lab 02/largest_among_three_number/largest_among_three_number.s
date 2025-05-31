	.file	"largest_among_three_number.c"
	.intel_syntax noprefix
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Enter three numbers: \0"
.LC1:
	.ascii "%d %d %d\0"
.LC2:
	.ascii "Largest number is: %d\12\0"
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
	lea	rax, .LC0[rip]
	mov	rcx, rax
	call	printf
	lea	rcx, -16[rbp]
	lea	rdx, -12[rbp]
	lea	rax, -8[rbp]
	mov	r9, rcx
	mov	r8, rdx
	mov	rdx, rax
	lea	rax, .LC1[rip]
	mov	rcx, rax
	call	scanf
	mov	eax, DWORD PTR -8[rbp]
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -12[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jge	.L2
	mov	eax, DWORD PTR -12[rbp]
	mov	DWORD PTR -4[rbp], eax
.L2:
	mov	eax, DWORD PTR -16[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jge	.L3
	mov	eax, DWORD PTR -16[rbp]
	mov	DWORD PTR -4[rbp], eax
.L3:
	mov	eax, DWORD PTR -4[rbp]
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
