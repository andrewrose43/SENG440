#include <stdio.h>
#include <math.h>
#include <stdlib.h>


//Derived from Mihai Sima's "Lesson 101: CORDIC" slideshow
//Copyright 2017 Mihai Sima

int main(int argc, char *argv[]){
	
	if (argc!=3){
		printf("Wrong number of testbench input arguments");
		exit(0);
	}
	
	double x_d, y_d, z_d; //64-bit floating point precision
	int x_i, y_i, z_i; //integer (fixed-point) variables

	//Convert input number strings into doubles
	x_d = atof(argv[1]);
	y_d = atof(argv[2]);

	/*
	printf("%f\n", x_d);
	printf("%f\n", y_d);
	*/

	//call to standard C math routine
	//atan returns a value in radians
	z_d = atan(y_d/x_d);

	//convert everything to 16-bit ints
	x_i = x_d * (1<<15);
	y_i = y_d * (1<<15);
	z_i = z_d * (1<<15);

	//PRINTING RESULTS
	printf("TESTBENCH OUTPUT\n");
	//compare the double and int representations of the values
	printf("x_d = %f\t\t\tx_i = %i\n", x_d, x_i);
	printf("y_d = %f\t\t\ty_i = %i\n", y_d, y_i);
	printf("z_d = %f\t\t\tz_i = %i\n", z_d, z_i);
}
