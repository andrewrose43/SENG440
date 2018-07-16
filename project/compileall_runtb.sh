gcc -std=c99 cordic_fixed_point.c  cordic_V_fixed_point.c -o cordic -lm
gcc -std=c99 ./testbench_split/testbench.c -o ./testbench_split/testbench.exe -lm
echo "Input x value: $1"
echo "Input y value: $2"
./testbench_split/testbench.exe $1 $2 > output.txt
echo "Note: the testbench's \"[xyz]_i\" values become the CORDIC main's \"[xyz]_i_init\" values." >> output.txt
echo $'Now plug the [xyz]_i values into ./cordic.\n' >> output.txt
cat output.txt

#(
#grep -o "x_i = [0-9]*" output.txt | sed -r s/[^0-9]*//
#grep -o "y_i = [0-9]*" output.txt | sed -r s/[^0-9]*//
#grep -o "z_i = [0-9]*" output.txt | sed -r s/[^0-9]*//
#) > tmp.txt

#cat tmp.txt | tr "\n" " "  > tmp2.txt
#./cordic < tmp2.txt
