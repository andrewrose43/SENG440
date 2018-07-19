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
	stmfd	sp!, {r4, r5, r6, r7}	@push registers to stack
	mov	r6, r1			@r1 is &y; save &y in r6
	ldr	r1, [r1, #0]		@load y into r1
	cmp	r1, #0			@compare y with 0
	mov	r7, r2			@r2 is &z; save &z into r7
	ldrle	r2, .L33		@load z_table pointer into r2 if y<=0 [DUPLICATE]
	ldr	ip, [r0, #0]		@r0 is &x; load x into ip (r12)
	ldrle	r3, [r2, #0]		@load z_table[0] into r2 if y<=0
	ldrgt	r2, .L33		@load z_table[0] into r3 if y>0 [DUPLICATE]
	mov	r5, r0			@r0 is &x; save &x in r5
	@Note: in future iterations of the loop, the next two instructions shift right the
	@contents of r1. No shift is required on the first iteration
	addle	r0, ip, r1		@r0 (new y) = x + y if y<=0
	rsbgt	r0, ip, r1		@r0 (new y) = y - x if y>0
	rsble	r4, r3, #0		@r4 (new z) = angle 0 if y<=0
	@Note: in future iterations of the loop, the next two instructions shift right the
	@contents of r0. No shift is required on the first iteration
	rsble	r1, r1, ip		@r1 (new x) = x - y if y<=0
	addgt	r1, ip, r1		@r1 (new x) = x + y if y>0
	ldrgt	r4, [r2, #0]		@load z_table[0] into r4 (new z) if y>0
	@The next iteration begins here
	@Note that the register being compared to 0 toggles between r0 and r1
	@for efficiency, r0 and r1 alternately contain x and y, swapping each iteration
	cmp	r0, #0			@compare y with 0
	ldrle	r3, [r2, #4]		@load z_table[1] into r3 if y<=0 [DUPLICATE]
	ldrgt	r3, [r2, #4]		@load z_table[1] into r3 if y<=0 [DUPLICATE]
	addle	ip, r0, r1, asr #1	@ip (new y) = y + x >> 1 if y<=0
	subgt	ip, r0, r1, asr #1	@ip (new y) = y - x >> 1 if y>0
	rsble	r4, r3, r4		@r4 (new z) = z - z_table[1] if y<=0
	addgt	r4, r4, r3		@r4 (new z) = z + z_table[1] if y>0
	suble	r0, r1, r0, asr #1	@r0 (new x) = x - y >> 1 if y<=0
	addgt	r0, r1, r0, asr #1	@r0 (new x) = x + y >> 1 if y>0
	@The next iteration begins here, and so on, and so forth.
	@On each iteration:
	@	-the right shifts grow by one
	@	-the address loaded from for z_table grows by 4 bytes (1 word)
	@	-r0 and r1 swap positions, since the alternate storing x and y
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
	@And now, the components of the new vector are stored in memory.
	str	ip, [r5, #0] 		@store x in memory
	str	r2, [r6, #0] 		@store y in memory
	str	r3, [r7, #0] 		@store z in memory
	ldmfd	sp!, {r4, r5, r6, r7} 	@pop registers from stack
	bx	lr 			@returns to calling routine
.L34:
	.align	2
.L33:
	.word	z_table
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
