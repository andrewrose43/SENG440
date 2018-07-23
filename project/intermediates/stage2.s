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
	ldr	ip, [r1, #0]		@r1 is &y; load y into ip
	stmfd	sp!, {r4, r5, r6, r7}	@push registers to stack
	ldr	r4, .L33		@load z_table pointer into r4
	ldr	r3, [r0, #0]		@r0 is &x; load x into r3
	cmp	ip, #0			@compare y with 0
	mov	r6, r1			@r1 is &y; save &y into r6
	ldr	r1, [r4, #0]		@load z_table[0] into r1
	mov	r7, r2			@r2 is &z; save &z in r7
	addle	r2, r3, ip		@r2 is new y_tmp; x_tmp_2 = x_tmp_1+y_tmp if y_tmp <= 0
	rsbgt	r2, r3, ip		@r2 is new y_tmp; x_tmp_2 = x_tmp_1-y_tmp if y_tmp > 0
	rsble	ip, ip, r3		@ip becomes x_tmp_2; x_tmp_2 = x_tmp_1-y_tmp if y_tmp<=0
	addgt	ip, r3, ip		@ip becomes x_tmp_2; x_tmp_2 = x_tmp_1-y_tmp if y_tmp>0
	mov	r5, r0			@save &x in r5
	rsble	r0, r1, #0		@if 
	movgt	r0, r1
	cmp	r2, #0
	ldr	r1, [r4, #4]
	addle	r3, r2, ip, asr #1
	subgt	r3, r2, ip, asr #1
	suble	r2, ip, r2, asr #1
	addgt	r2, ip, r2, asr #1
	rsble	r0, r1, r0
	addgt	r0, r0, r1
	cmp	r3, #0
	ldr	r1, [r4, #8]
	addle	ip, r3, r2, asr #2
	subgt	ip, r3, r2, asr #2
	suble	r2, r2, r3, asr #2
	addgt	r2, r2, r3, asr #2
	rsble	r0, r1, r0
	addgt	r0, r0, r1
	cmp	ip, #0
	ldr	r1, [r4, #12]
	addle	r3, ip, r2, asr #3
	subgt	r3, ip, r2, asr #3
	suble	r2, r2, ip, asr #3
	addgt	r2, r2, ip, asr #3
	rsble	r0, r1, r0
	addgt	r0, r0, r1
	cmp	r3, #0
	ldr	r1, [r4, #16]
	addle	ip, r3, r2, asr #4
	subgt	ip, r3, r2, asr #4
	suble	r2, r2, r3, asr #4
	addgt	r2, r2, r3, asr #4
	rsble	r0, r1, r0
	addgt	r0, r0, r1
	cmp	ip, #0
	ldr	r1, [r4, #20]
	addle	r3, ip, r2, asr #5
	subgt	r3, ip, r2, asr #5
	suble	r2, r2, ip, asr #5
	addgt	r2, r2, ip, asr #5
	rsble	r0, r1, r0
	addgt	r0, r0, r1
	cmp	r3, #0
	ldr	r1, [r4, #24]
	addle	ip, r3, r2, asr #6
	subgt	ip, r3, r2, asr #6
	suble	r2, r2, r3, asr #6
	addgt	r2, r2, r3, asr #6
	rsble	r0, r1, r0
	addgt	r0, r0, r1
	cmp	ip, #0
	ldr	r1, [r4, #28]
	addle	r3, ip, r2, asr #7
	subgt	r3, ip, r2, asr #7
	suble	r2, r2, ip, asr #7
	addgt	r2, r2, ip, asr #7
	rsble	r0, r1, r0
	addgt	r0, r0, r1
	cmp	r3, #0
	ldr	r1, [r4, #32]
	addle	ip, r3, r2, asr #8
	subgt	ip, r3, r2, asr #8
	suble	r2, r2, r3, asr #8
	addgt	r2, r2, r3, asr #8
	rsble	r0, r1, r0
	addgt	r0, r0, r1
	cmp	ip, #0
	ldr	r1, [r4, #36]
	addle	r3, ip, r2, asr #9
	subgt	r3, ip, r2, asr #9
	suble	r2, r2, ip, asr #9
	addgt	r2, r2, ip, asr #9
	rsble	r0, r1, r0
	addgt	r0, r0, r1
	cmp	r3, #0
	ldr	r1, [r4, #40]
	addle	ip, r3, r2, asr #10
	subgt	ip, r3, r2, asr #10
	suble	r2, r2, r3, asr #10
	addgt	r2, r2, r3, asr #10
	rsble	r0, r1, r0
	addgt	r0, r0, r1
	cmp	ip, #0
	ldr	r1, [r4, #44]
	addle	r3, ip, r2, asr #11
	subgt	r3, ip, r2, asr #11
	suble	r2, r2, ip, asr #11
	addgt	r2, r2, ip, asr #11
	rsble	r0, r1, r0
	addgt	r0, r0, r1
	cmp	r3, #0
	ldr	r1, [r4, #48]
	addle	ip, r3, r2, asr #12
	subgt	ip, r3, r2, asr #12
	suble	r2, r2, r3, asr #12
	addgt	r2, r2, r3, asr #12
	rsble	r0, r1, r0
	addgt	r0, r0, r1
	cmp	ip, #0
	ldr	r1, [r4, #52]
	addle	r3, ip, r2, asr #13
	subgt	r3, ip, r2, asr #13
	suble	ip, r2, ip, asr #13
	addgt	ip, r2, ip, asr #13
	ldr	r2, [r4, #56]
	rsble	r1, r1, r0
	addgt	r1, r0, r1
	cmp	r3, #0
	subgt	r0, r3, ip, asr #14
	addle	r0, r3, ip, asr #14
	addgt	r2, r1, r2
	addgt	r3, ip, r3, asr #14
	rsble	r2, r2, r1
	suble	r3, ip, r3, asr #14
	str	r3, [r5, #0]
	str	r0, [r6, #0]
	str	r2, [r7, #0]
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L34:
	.align	2
.L33:
	.word	z_table
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,64,4
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
