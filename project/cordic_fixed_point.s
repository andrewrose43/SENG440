	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"cordic_fixed_point.c"
	.global	z_table
	.data
	.align	2
	.type	z_table, %object
	.size	z_table, 60
z_table:
	.word	25735
	.word	15192
	.word	8027
	.word	4074
	.word	2045
	.word	1023
	.word	511
	.word	255
	.word	127
	.word	63
	.word	31
	.word	15
	.word	7
	.word	3
	.word	1
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.global	__aeabi_dmul
	.section	.rodata
	.align	2
.LC0:
	.ascii	"x_i_init = %5i\011x_d_init = %f\012\000"
	.align	2
.LC1:
	.ascii	"y_i_init = %5i\011y_d_init = %f\012\000"
	.align	2
.LC2:
	.ascii	"z_i_init = %5i\011z_d_init = %f (rad)\012\012\000"
	.align	2
.LC3:
	.ascii	"x_i_calc = %5i\011x_d_calc = %f\012\000"
	.align	2
.LC4:
	.ascii	"y_i_calc = %5i\011y_d_calc = %f\012\000"
	.align	2
.LC5:
	.ascii	"z_i_calc = %5i\011z_d_calc = %f (rad)\012\012\000"
	.global	__aeabi_dadd
	.align	2
.LC6:
	.ascii	"Modulus = SQRT(x_d_init^2 + y_d_init^2) = %f\012\000"
	.text
	.align	2
	.global	verify
	.type	verify, %function
verify:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #68
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	str	r2, [fp, #-88]
	str	r3, [fp, #-92]
	ldr	r0, [fp, #-80]
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #14680064
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-76]
	str	r4, [fp, #-72]
	ldr	r0, [fp, #-84]
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #14680064
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-68]
	str	r4, [fp, #-64]
	ldr	r0, [fp, #-88]
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #14680064
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
	ldr	r0, [fp, #-92]
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #14680064
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L3
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
	ldr	r0, [fp, #4]
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #14680064
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	adr	r6, .L3
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	ldr	r0, [fp, #8]
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #14680064
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	ldr	r0, .L3+8
	ldr	r1, [fp, #-80]
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L3+12
	ldr	r1, [fp, #-84]
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L3+16
	ldr	r1, [fp, #-88]
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L3+20
	ldr	r1, [fp, #-92]
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L3+24
	ldr	r1, [fp, #4]
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r0, .L3+28
	ldr	r1, [fp, #8]
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	bl	printf
	sub	r4, fp, #76
	ldmia	r4, {r3-r4}
	sub	r6, fp, #76
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r7, r3
	mov	r8, r4
	sub	r4, fp, #68
	ldmia	r4, {r3-r4}
	sub	r6, fp, #68
	ldmia	r6, {r5-r6}
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r0, r7
	mov	r1, r8
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_dadd
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	sqrt
	mov	r3, r0
	mov	r4, r1
	ldr	r0, .L3+32
	mov	r2, r3
	mov	r3, r4
	bl	printf
	sub	sp, fp, #24
	ldmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}
	bx	lr
.L4:
	.align	3
.L3:
	.word	-1257819312
	.word	1071869597
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.size	verify, .-verify
	.section	.rodata
	.align	2
.LC7:
	.ascii	"Vectoring CORDIC:\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-36]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	atoi
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-36]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	atoi
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	atoi
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r0, .L7
	bl	puts
	sub	r3, fp, #20
	sub	r2, fp, #24
	sub	ip, fp, #28
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	cordic_V_fixed_point
	ldr	ip, [fp, #-20]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r2, [fp, #-8]
	mov	r3, ip
	bl	verify
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LC7
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
