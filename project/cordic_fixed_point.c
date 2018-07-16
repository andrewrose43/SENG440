#include <stdio.h>
#include <math.h>
#include <stdlib.h>

//Derived from Mihai Sima's "Lesson 101: CORDIC" slideshow
//Copyright 2017 Mihai Sima

int z_table[15] = {25735, 15192, 8027, 4074, 2045, 1023, 511, 255, 127, 63, 31, 15, 7, 3, 1};


void cordic_V_fixed_point(int *x, int *y, int *z); //defined elsewhere


//verify is purely a printer function!
//this only does visuals!!
//it compares the old vector to the new vector
void verify(int x_i_init, int y_i_init, int z_i_init,
		int x_i, int y_i, int z_i){
	double x_d_init, y_d_init, z_d_init, x_d, y_d, z_d;

	x_d_init = (double)x_i_init / (1<<15); //float image of x_i_init
	y_d_init = (double)y_i_init / (1<<15); //float image of y_i_init
	z_d_init = (double)z_i_init / (1<<15); //float image of z_i_init

	//note: the 0.607xx is the cosine scaling factor
	x_d = ((double)x_i / (1<<15)) * 0.607252935; //float image of x_i
	y_d = ((double)y_i / (1<<15)) * 0.607252935; //float image of y_i
	z_d = ((double)z_i / (1<<15)); //float image of z_i

	printf("x_i_init = %5i\tx_d_init = %f\n", x_i_init, x_d_init);
	printf("y_i_init = %5i\ty_d_init = %f\n", y_i_init, y_d_init);
	printf("z_i_init = %5i\tz_d_init = %f (rad)\n\n", z_i_init, z_d_init);

	printf("x_i_calc = %5i\tx_d_calc = %f\n", x_i, x_d);
	printf("y_i_calc = %5i\ty_d_calc = %f\n", y_i, y_d);
	printf("z_i_calc = %5i\tz_d_calc = %f (rad)\n\n", z_i, z_d);
	printf("Modulus = SQRT(x_d_init^2 + y_d_init^2) = %f\n",
		sqrt(x_d_init*x_d_init+y_d_init*y_d_init));
}


void main(int argc, char *args[]){
	int x_i_init, y_i_init, z_i_init; //initial values
	int x_i, y_i, z_i; //integer (fixed-point) variables

	x_i = (x_i_init = atoi(args[1]));
	y_i = (y_i_init = atoi(args[2]));
	z_i_init = atoi(args[3]);

	printf("Vectoring CORDIC:\n\n");
	cordic_V_fixed_point(&x_i, &y_i, &z_i);

	verify(x_i_init, y_i_init, z_i_init, x_i, y_i, z_i);
}
