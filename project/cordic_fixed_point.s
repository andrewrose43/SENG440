	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"cordic_fixed_point.c"
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_dadd
	.text
	.align	2
	.global	verify
	.type	verify, %function
verify:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r4, #0
	sub	sp, sp, #12
	mov	r5, #1056964608
	mov	sl, r2
	mov	fp, r3
	mov	r7, r1
	mov	r6, r0
	bl	__aeabi_i2d
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dmul
	stmia	sp, {r0-r1}
	mov	r0, r7
	bl	__aeabi_i2d
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dmul
	ldmia	sp, {r2-r3}
	mov	r8, r0
	mov	r9, r1
	ldr	r0, .L3+8
	mov	r1, r6
	bl	printf
	mov	r2, r8
	mov	r3, r9
	mov	r1, r7
	ldr	r0, .L3+12
	bl	printf
	mov	r0, sl
	bl	__aeabi_i2d
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L3+16
	mov	r1, sl
	bl	printf
	adr	r7, .L3
	ldmia	r7, {r6-r7}
	mov	r0, fp
	bl	__aeabi_i2d
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dmul
	mov	r2, r6
	mov	r3, r7
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L3+20
	mov	r1, fp
	bl	printf
	ldr	r0, [sp, #48]
	bl	__aeabi_i2d
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dmul
	mov	r2, r6
	mov	r3, r7
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L3+24
	ldr	r1, [sp, #48]
	bl	printf
	ldr	r0, [sp, #52]
	bl	__aeabi_i2d
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L3+28
	ldr	r1, [sp, #52]
	bl	printf
	ldmia	sp, {r0-r1}
	mov	r2, r0
	mov	r3, r1
	bl	__aeabi_dmul
	mov	r2, r8
	mov	r4, r0
	mov	r5, r1
	mov	r3, r9
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	bl	sqrt
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L3+32
	bl	printf
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
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
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, r1
	sub	sp, sp, #24
	mov	r2, #10
	mov	r1, #0
	ldr	r0, [r4, #4]
	bl	strtol
	mov	r1, #0
	mov	r6, r0
	mov	r2, #10
	ldr	r0, [r4, #8]
	str	r6, [sp, #20]
	bl	strtol
	mov	r1, #0
	mov	r5, r0
	mov	r2, #10
	ldr	r0, [r4, #12]
	str	r5, [sp, #16]
	bl	strtol
	mov	r4, r0
	ldr	r0, .L7
	bl	puts
	add	r0, sp, #20
	add	r1, sp, #16
	add	r2, sp, #12
	bl	cordic_V_fixed_point
	mov	r2, r4
	add	r4, sp, #12
	ldmia	r4, {r4, ip}	@ phole ldm
	mov	r0, r6
	mov	r1, r5
	ldr	r3, [sp, #20]
	str	ip, [sp, #0]
	str	r4, [sp, #4]
	bl	verify
	add	sp, sp, #24
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LC7
	.size	main, .-main
	.global	z_table
	.data
	.align	2
	.type	z_table, %object
	.size	z_table, 64
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
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"x_i_init = %5i\011x_d_init = %f\012\000"
	.space	2
.LC1:
	.ascii	"y_i_init = %5i\011y_d_init = %f\012\000"
	.space	2
.LC2:
	.ascii	"z_i_init = %5i\011z_d_init = %f (rad)\012\012\000"
	.space	3
.LC3:
	.ascii	"x_i_calc = %5i\011x_d_calc = %f\012\000"
	.space	2
.LC4:
	.ascii	"y_i_calc = %5i\011y_d_calc = %f\012\000"
	.space	2
.LC5:
	.ascii	"z_i_calc = %5i\011z_d_calc = %f (rad)\012\012\000"
	.space	3
.LC6:
	.ascii	"Modulus = SQRT(x_d_init^2 + y_d_init^2) = %f\012\000"
	.space	2
.LC7:
	.ascii	"Vectoring CORDIC:\012\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
