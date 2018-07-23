int z_table[16]; //array grows by one index to include dummy value and accommodate preemptive loading

void cordic_V_fixed_point(int *x, int *y, int *z){

	//SETUP
	register int x_tmp_1, y_tmp, z_tmp;
	register int x_tmp_2;
	register int z_table_tmp; //New variable for improved pipelining
	register int i;
	
	x_tmp_1 = *x;
	y_tmp = *y;
	z_tmp = 0;

	//THE HEART OF THE CODE
	z_table_tmp  = z_table[0]; //Loading ahead of first iteration of loop
	for (i=0; i<15; i++){ //we want 15 iterations
		if (y_tmp > 0){
			x_tmp_2 = x_tmp_1 + (y_tmp >> i);
			y_tmp = y_tmp - (x_tmp_1 >> i);
			z_tmp += z_table_tmp;
		}
		else{
			x_tmp_2 = x_tmp_1 - (y_tmp >> i);
			y_tmp = y_tmp + (x_tmp_1 >> i);
			z_tmp -= z_table_tmp;
		}
		x_tmp_1 = x_tmp_2;
		z_table_tmp = z_table[i+1]; //Load the value from memory ahead of when it is needed
	}
	*x = x_tmp_1;
	*y = y_tmp;
	*z = z_tmp;
	//No math.h is needed, because only integers are being manipulated
}
