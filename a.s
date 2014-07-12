	.file	1 "a.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.globl	x
	.data
	.align	2
	.type	x, @object
	.size	x, 4
x:
	.word	4
	.globl	y
	.align	2
	.type	y, @object
	.size	y, 4
y:
	.word	9
	.rdata
	.align	2
$LC0:
	.ascii	"x = %u, y = %u\012\000"
	.text
	.align	2
	.globl	main
	.ent	main
	.type	main, @function
main:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	lw	$2,%got(x)($28)
	lw	$3,0($2)
	lw	$2,%got(y)($28)
	lw	$6,0($2)
	lw	$2,%got($LC0)($28)
	addiu	$4,$2,%lo($LC0)
	move	$5,$3
	lw	$25,%call16(printf)($28)
	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.ident	"GCC: (GNU) 4.0.0 (DENX ELDK 4.1 4.0.0)"
