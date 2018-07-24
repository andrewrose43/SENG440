arm-linux-gcc -S -O3 cordic_fixed_point.c
arm-linux-gcc -static cordic_fixed_point.s ./intermediates/stage3.s -lm -o arose2.out
mv arose2.out ./intermediates
echo "Now go to Ray's ~/Desktop/SENG\ 440 and run logon_lftp.bat"
