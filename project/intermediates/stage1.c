
//stage1.c
//Derived from Mihai Sima's "Lesson 101: CORDIC" slideshow
//Copyright 2017 Mihai Sima

int z_table[15];

void cordic_V_fixed_point(int *x, int *y, int *z){

	//SETUP
	//note that all these variables are not register ints
	//ARM has more than enough registers to do this
	//also, y_tmp_2 is gone; it could be removed without causing any problems
	//lines that formerly made assignments to y_tmp_2 now make assignments to y_tmp
	//(y_tmp_1 has been renamed y_tmp)
	register int x_tmp_1, y_tmp, z_tmp;
	register int x_tmp_2;
	register int i;
	
	x_tmp_1 = *x;
	y_tmp = *y;
	z_tmp = 0;

	for (i=0; i<15; i++){
		if (y_tmp > 0){
			x_tmp_2 = x_tmp_1 + (y_tmp >> i);
			y_tmp = y_tmp - (x_tmp_1 >> i);
			z_tmp += z_table[i];
		}
		else{
			x_tmp_2 = x_tmp_1 - (y_tmp >> i);
			y_tmp = y_tmp + (x_tmp_1 >> i);
			z_tmp -= z_table[i];
		}
		x_tmp_1 = x_tmp_2;
		//this is where the y_tmp_2 assignment used to be
	}
	*x = x_tmp_1;
	*y = y_tmp;
	*z = z_tmp;
}
