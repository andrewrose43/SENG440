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
	.file	"cordic_V_fixed_point.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7}
	mov	r6, r1
	ldr	r1, [r1, #0]
	cmp	r1, #0
	mov	r7, r2
	ldrle	r2, .L33
	ldr	ip, [r0, #0]
	ldrle	r3, [r2, #0]
	ldrgt	r2, .L33
	mov	r5, r0
	addle	r0, ip, r1
	rsbgt	r0, ip, r1
	rsble	r4, r3, #0
	rsble	r1, r1, ip
	addgt	r1, ip, r1
	ldrgt	r4, [r2, #0]
	cmp	r0, #0
	ldrle	r3, [r2, #4]
	ldrgt	r3, [r2, #4]
	addle	ip, r0, r1, asr #1
	subgt	ip, r0, r1, asr #1
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	r0, r1, r0, asr #1
	addgt	r0, r1, r0, asr #1
	cmp	ip, #0
	ldrle	r3, [r2, #8]
	ldrgt	r3, [r2, #8]
	addle	r1, ip, r0, asr #2
	subgt	r1, ip, r0, asr #2
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	r0, r0, ip, asr #2
	addgt	r0, r0, ip, asr #2
	cmp	r1, #0
	ldrle	r3, [r2, #12]
	ldrgt	r3, [r2, #12]
	addle	ip, r1, r0, asr #3
	subgt	ip, r1, r0, asr #3
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	r0, r0, r1, asr #3
	addgt	r0, r0, r1, asr #3
	cmp	ip, #0
	ldrle	r3, [r2, #16]
	ldrgt	r3, [r2, #16]
	addle	r1, ip, r0, asr #4
	subgt	r1, ip, r0, asr #4
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	r0, r0, ip, asr #4
	addgt	r0, r0, ip, asr #4
	cmp	r1, #0
	ldrle	r3, [r2, #20]
	ldrgt	r3, [r2, #20]
	addle	ip, r1, r0, asr #5
	subgt	ip, r1, r0, asr #5
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	r0, r0, r1, asr #5
	addgt	r0, r0, r1, asr #5
	cmp	ip, #0
	ldrle	r3, [r2, #24]
	ldrgt	r3, [r2, #24]
	addle	r1, ip, r0, asr #6
	subgt	r1, ip, r0, asr #6
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	r0, r0, ip, asr #6
	addgt	r0, r0, ip, asr #6
	cmp	r1, #0
	ldrle	r3, [r2, #28]
	ldrgt	r3, [r2, #28]
	addle	ip, r1, r0, asr #7
	subgt	ip, r1, r0, asr #7
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	r0, r0, r1, asr #7
	addgt	r0, r0, r1, asr #7
	cmp	ip, #0
	ldrle	r3, [r2, #32]
	ldrgt	r3, [r2, #32]
	addle	r1, ip, r0, asr #8
	subgt	r1, ip, r0, asr #8
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	r0, r0, ip, asr #8
	addgt	r0, r0, ip, asr #8
	cmp	r1, #0
	ldrle	r3, [r2, #36]
	ldrgt	r3, [r2, #36]
	addle	ip, r1, r0, asr #9
	subgt	ip, r1, r0, asr #9
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	r0, r0, r1, asr #9
	addgt	r0, r0, r1, asr #9
	cmp	ip, #0
	ldrle	r3, [r2, #40]
	ldrgt	r3, [r2, #40]
	addle	r1, ip, r0, asr #10
	subgt	r1, ip, r0, asr #10
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	r0, r0, ip, asr #10
	addgt	r0, r0, ip, asr #10
	cmp	r1, #0
	ldrle	r3, [r2, #44]
	ldrgt	r3, [r2, #44]
	addle	ip, r1, r0, asr #11
	subgt	ip, r1, r0, asr #11
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	r0, r0, r1, asr #11
	addgt	r0, r0, r1, asr #11
	cmp	ip, #0
	ldrle	r3, [r2, #48]
	ldrgt	r3, [r2, #48]
	addle	r1, ip, r0, asr #12
	subgt	r1, ip, r0, asr #12
	rsble	r4, r3, r4
	addgt	r4, r4, r3
	suble	r0, r0, ip, asr #12
	addgt	r0, r0, ip, asr #12
	cmp	r1, #0
	ldrle	r3, [r2, #52]
	ldrgt	r3, [r2, #52]
	addle	ip, r1, r0, asr #13
	subgt	ip, r1, r0, asr #13
	rsble	r4, r3, r4
	suble	r1, r0, r1, asr #13
	addgt	r4, r4, r3
	addgt	r1, r0, r1, asr #13
	cmp	ip, #0
	ldrgt	r3, [r2, #56]
	ldrle	r3, [r2, #56]
	subgt	r2, ip, r1, asr #14
	addle	r2, ip, r1, asr #14
	addgt	r3, r4, r3
	addgt	ip, r1, ip, asr #14
	rsble	r3, r3, r4
	suble	ip, r1, ip, asr #14
	str	ip, [r5, #0]
	str	r2, [r6, #0]
	str	r3, [r7, #0]
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L34:
	.align	2
.L33:
	.word	z_table
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
