arm-linux-gcc -S -O3 cordic_V_fixed_point.c
mv cordic_V_fixed_point.s ./intermediates
arm-linux-gcc -static -O3 cordic_V_fixed_point.c cordic_fixed_point.c -lm -o arose.out
mv arose.out ./intermediates
echo "Now go to Ray's ~/Desktop/SENG\ 440 and run logon_lftp.bat"
