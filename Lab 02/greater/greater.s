	.file	"greater.c"
	.intel_syntax noprefix
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Enter two numbers: \0"
.LC1:
	.ascii "%d %d\0"
.LC2:
	.ascii "%d is greater than %d\12\0"
.LC3:
	.ascii "Both numbers are equal.\0"
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
	lea	rdx, -8[rbp]
	lea	rax, -4[rbp]
	mov	r8, rdx
	mov	rdx, rax
	lea	rax, .LC1[rip]
	mov	rcx, rax
	call	scanf
	mov	edx, DWORD PTR -4[rbp]
	mov	eax, DWORD PTR -8[rbp]
	cmp	edx, eax
	jle	.L2
	mov	edx, DWORD PTR -8[rbp]
	mov	eax, DWORD PTR -4[rbp]
	mov	r8d, edx
	mov	edx, eax
	lea	rax, .LC2[rip]
	mov	rcx, rax
	call	printf
	jmp	.L3
.L2:
	mov	edx, DWORD PTR -8[rbp]
	mov	eax, DWORD PTR -4[rbp]
	cmp	edx, eax
	jle	.L4
	mov	edx, DWORD PTR -4[rbp]
	mov	eax, DWORD PTR -8[rbp]
	mov	r8d, edx
	mov	edx, eax
	lea	rax, .LC2[rip]
	mov	rcx, rax
	call	printf
	jmp	.L3
.L4:
	lea	rax, .LC3[rip]
	mov	rcx, rax
	call	puts
.L3:
	mov	eax, 0
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 13.3.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
