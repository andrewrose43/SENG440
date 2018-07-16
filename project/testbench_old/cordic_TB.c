#include <stdio.h>
#include <math.h>

int main(void){
	double x_d, y_d, z_d; //64-bit floating point precision
	int x_i, y_i, z_i; //integer (fixed-point) variables

	x_d = 0.85;
	y_d = 0.76;
	//call to standard C math routine
	//atan returns a value in radians
	z_d = atan(y_d/x_d);

	//convert everything to 16-bit ints
		x_i = x_d * (1<<15);
		y_i = y_d * (1<<15);
		z_i = z_d * (1<<15);

	//compare the double and int representations of the values
	printf("x_d = %f\t\t\tx_i = %i\n", x_d, x_i);
	printf("y_d = %f\t\t\ty_i = %i\n", y_d, y_i);
	printf("z_d = %f\t\t\tz_i = %i\n", z_d, z_i);

	printf("\n");
	printf("The angle table:\n");
	for (int i = 0; i < 15; i++){
		printf("x[%2i] = %i\n", i,
			(int)(atan( pow(2.0, (double)(-i)))*(1<<15)));
			//Holy schlamoly what is going on in that line
			//everything in the atan brackets is just a tangent ratio
			//these are all the elementary angles!
			//not a sum of the angles. Just the exponentially-smaller elementary angles
			//It's the ANGLE that is being converted to and shifted left
	}
}
