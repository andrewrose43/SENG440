void HW_cordic_V_fixed_point(int *x, int *y, int *z){
	register int x_tmp, y_tmp, z_tmp;
	register int xz_tmp; //single int can store two 16-bit variables

	x_tmp = *x;
	y_tmp = *y;

	//Custom instruction which calls the firmware or hardware computing unit
	__asm__ __volatile__ ("CORDIC_V %0, %1, %2"
		: "=r" (xz_tmp) : "r" (x_tmp), "r" (y_tmp));

	*x = xz_tmp >> 16;
	z_tmp = (xz_tmp << 16) >> 16; //shift and un-shift removes x
	*z = z_tmp;
}
