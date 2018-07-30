HW_cordic_V_fixed_point:
	ldr	ip, [r1, #0]	@ip (r12) = y_tmp
	ldr	r3, [r0, #0]	@r3 = x_tmp
	CORDIC_V r3, r3, ip	@r3 = xz_tmp
	mov	r1, r3, asl #16 @r1 = xz_tmp<<16
	mov	r1, r1, asr #16 @r1 = z_final
	mov	r3, r3, asr #16 @r3 = x_final
	str	r3, [r0, #0]	@Store x_final into memory
	str	r1, [r2, #0]	@Store z_final into memory
	bx	lr		@return to calling routine
