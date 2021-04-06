load probandoALU.hdl;
output-file probandoALU.out;
output-list x y zx nx zy ny f no out zr ng;

set x %B0110100110110110, set y %B1001011011111001,set zx 0 ,set nx 0,set zy 1,set ny 0,set f 0,set no 0 ,eval, output;
set x %B0110100110100110, set y %B1001011010011101,set zx 0 ,set nx 1,set zy 1,set ny 1,set f 0,set no 0 ,eval, output;
set x %B1111000110100110, set y %B1001011010010111,set zx 0 ,set nx 0,set zy 1,set ny 0,set f 0,set no 0 ,eval, output;
set x %B1110110110100110, set y %B1001010111001001,set zx 0 ,set nx 1,set zy 1,set ny 1,set f 0,set no 0 ,eval, output;
set x %B1110111110100110, set y %B1001011011100100,set zx 0 ,set nx 1,set zy 1,set ny 0,set f 0,set no 0 ,eval, output;


