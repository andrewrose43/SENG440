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
	.file	"HW_cordic_V_fixed_point.c"
	.text
	.align	2
	.global	HW_cordic_V_fixed_point
	.type	HW_cordic_V_fixed_point, %function
HW_cordic_V_fixed_point:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [r1, #0]
	ldr	r3, [r0, #0]
#APP
@ 8 "HW_cordic_V_fixed_point.c" 1
	CORDIC_V r3, r3, ip
@ 0 "" 2
	mov	r1, r3, asl #16
	mov	r1, r1, asr #16
	mov	r3, r3, asr #16
	str	r3, [r0, #0]
	str	r1, [r2, #0]
	bx	lr
	.size	HW_cordic_V_fixed_point, .-HW_cordic_V_fixed_point
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
