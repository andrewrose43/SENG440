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
	cmp	ip, #0			@compare y_tmp with 0
	ldr	r6, [r4, #0]		@load z_table[0] into r6
	mov	r7, r2			@r2 is &z; save &z in r7
	addle	r2, r3, ip		@r2 is new y_tmp; y_tmp = y_tmp+x_tmp_1 if y_tmp<=0
	rsbgt	r2, r3, ip		@r2 is new y_tmp; y_tmp = y_tmp-x_tmp_1 if y_tmp>0
	rsble	ip, ip, r3		@ip becomes x_tmp_2; x_tmp_2 = x_tmp_1-old y_tmp if old y_tmp<=0
	addgt	ip, r3, ip		@ip becomes x_tmp_2; x_tmp_2 = x_tmp_1+old y_tmp if old y_tmp>0
	mov	r5, r0			@save &x in r5
	rsble	r0, r6, #0		@z_tmp -= z_table[0] if y_tmp <= 0
	movgt	r0, r6			@z_tmp = z_table[0] if y_tmp > 0
	cmp	r2, #0			@compare y_tmp with 0
	ldr	r6, [r4, #4]		@load z_table[1] into r6
	@At this point in stage2.c, x_tmp_2 is assigned to z_tmp_1
	@The compiler doesn't bother with this and instead just reuses the ip register
	@which was set to x_tmp_2 in the previous loop iteration
	@wherever x_tmp_1 appeared in the C code.
	@So I'll refer to ip as if it were x_tmp_1 now to be consistent with the C.
	addle	r3, r2, ip, asr #1	@r3 is new y_tmp; y_tmp = y_tmp+(x_tmp_1>>1) if y_tmp<=0
	subgt	r3, r2, ip, asr #1	@r3 is new y_tmp; y_tmp = y_tmp-(x_tmp_1>>1) if y_tmp>0
	suble	r2, ip, r2, asr #1	@r2 becomes x_tmp_2; x_tmp_2 = x_tmp_1-(old y_tmp>>1) if old y_tmp<=0
	addgt	r2, ip, r2, asr #1	@r2 becomes x_tmp_2; x_tmp_2 = x_tmp_1-(old y_tmp>>1) if old y_tmp>0
	rsble	r0, r6, r0		@subtract z_table[1] from z_tmp if old y_tmp<=0
	addgt	r0, r0, r6		@add z_table[1] to z_tmp if old y_tmp>0
	cmp	r3, #0			@compare y_tmp with 0
	ldr	r6, [r4, #8]		@load z_table[2] into r6
	addle	ip, r3, r2, asr #2	@ip is new y_tmp; y_tmp = y_tmp+(x_tmp_1>>2) if y_tmp<=0
	subgt	ip, r3, r2, asr #2	@ip is new y_tmp; y_tmp = y_tmp-(x_tmp_1>>2) if y_tmp>0
	suble	r2, r2, r3, asr #2	@r2 becomes x_tmp_2; x_tmp_2 = x_tmp_1-(old y_tmp>>2) if old y_tmp<=0
	addgt	r2, r2, r3, asr #2	@r2 becomes x_tmp_2; x_tmp_2 = x_tmp_1+(old y_tmp>>2) if old y_tmp>0
	rsble	r0, r6, r0		@subtract z_table[2] from z_tmp if old y_tmp<=0
	addgt	r0, r0, r6		@add z_table[2] to z_tmp if old y_tmp>0
	@The next iteration begins here, and so on.
	@On each iteration:
	@	-the right shifts grow by one
	@	-the address loaded from for z_table grows by 4 bytes (1 word)
	@	-the r3 and ip registers swap positions
	cmp	ip, #0
	ldr	r6, [r4, #12]
	addle	r3, ip, r2, asr #3
	subgt	r3, ip, r2, asr #3
	suble	r2, r2, ip, asr #3
	addgt	r2, r2, ip, asr #3
	rsble	r0, r6, r0
	addgt	r0, r0, r6
	cmp	r3, #0
	ldr	r6, [r4, #16]
	addle	ip, r3, r2, asr #4
	subgt	ip, r3, r2, asr #4
	suble	r2, r2, r3, asr #4
	addgt	r2, r2, r3, asr #4
	rsble	r0, r6, r0
	addgt	r0, r0, r6
	cmp	ip, #0
	ldr	r6, [r4, #20]
	addle	r3, ip, r2, asr #5
	subgt	r3, ip, r2, asr #5
	suble	r2, r2, ip, asr #5
	addgt	r2, r2, ip, asr #5
	rsble	r0, r6, r0
	addgt	r0, r0, r6
	cmp	r3, #0
	ldr	r6, [r4, #24]
	addle	ip, r3, r2, asr #6
	subgt	ip, r3, r2, asr #6
	suble	r2, r2, r3, asr #6
	addgt	r2, r2, r3, asr #6
	rsble	r0, r6, r0
	addgt	r0, r0, r6
	cmp	ip, #0
	ldr	r6, [r4, #28]
	addle	r3, ip, r2, asr #7
	subgt	r3, ip, r2, asr #7
	suble	r2, r2, ip, asr #7
	addgt	r2, r2, ip, asr #7
	rsble	r0, r6, r0
	addgt	r0, r0, r6
	cmp	r3, #0
	ldr	r6, [r4, #32]
	addle	ip, r3, r2, asr #8
	subgt	ip, r3, r2, asr #8
	suble	r2, r2, r3, asr #8
	addgt	r2, r2, r3, asr #8
	rsble	r0, r6, r0
	addgt	r0, r0, r6
	cmp	ip, #0
	ldr	r6, [r4, #36]
	addle	r3, ip, r2, asr #9
	subgt	r3, ip, r2, asr #9
	suble	r2, r2, ip, asr #9
	addgt	r2, r2, ip, asr #9
	rsble	r0, r6, r0
	addgt	r0, r0, r6
	cmp	r3, #0
	ldr	r6, [r4, #40]
	addle	ip, r3, r2, asr #10
	subgt	ip, r3, r2, asr #10
	suble	r2, r2, r3, asr #10
	addgt	r2, r2, r3, asr #10
	rsble	r0, r6, r0
	addgt	r0, r0, r6
	cmp	ip, #0
	ldr	r6, [r4, #44]
	addle	r3, ip, r2, asr #11
	subgt	r3, ip, r2, asr #11
	suble	r2, r2, ip, asr #11
	addgt	r2, r2, ip, asr #11
	rsble	r0, r6, r0
	addgt	r0, r0, r6
	cmp	r3, #0
	ldr	r6, [r4, #48]
	addle	ip, r3, r2, asr #12
	subgt	ip, r3, r2, asr #12
	suble	r2, r2, r3, asr #12
	addgt	r2, r2, r3, asr #12
	rsble	r0, r6, r0
	addgt	r0, r0, r6
	cmp	ip, #0
	ldr	r6, [r4, #52]
	addle	r3, ip, r2, asr #13
	subgt	r3, ip, r2, asr #13
	suble	ip, r2, ip, asr #13
	addgt	ip, r2, ip, asr #13
	ldr	r2, [r4, #56]
	rsble	r6, r6, r0
	addgt	r6, r0, r6
	cmp	r3, #0
	subgt	r0, r3, ip, asr #14
	addle	r0, r3, ip, asr #14
	addgt	r2, r6, r2
	addgt	r3, ip, r3, asr #14
	rsble	r2, r2, r6
	suble	r3, ip, r3, asr #14
	@And now, the components of the new vector are stored in memory
	str	r3, [r5, #0] 		@store x in memory
	str	r0, [r1, #0]		@store y in memory
	str	r2, [r7, #0]		@store z in memory
	ldmfd	sp!, {r4, r5, r6, r7}	@pop registers from stack
	bx	lr			@return to calling routine
.L34:
	.align	2
.L33:
	.word	z_table
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,64,4
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
