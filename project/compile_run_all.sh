gcc -std=c99 cordic_fixed_point.c  cordic_V_fixed_point.c -o cordic -lm
gcc -std=c99 ./testbench_split/testbench.c -o ./testbench_split/testbench.exe -lm
echo "Input x value: $1"
echo "Input y value: $2"
./testbench_split/testbench.exe $1 $2 > output.txt
