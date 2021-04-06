load Registro8.hdl;
output-file Registro8.out;
output-list in flag out;

// set in %B11111111, set flag 1,eval, output;
// set in %B01111111, set flag 0,eval, output;
// set in %B00111111, set flag 0,eval, output;
// set in %B00011111, set flag 1,eval, output;
// set in %B00001111, set flag 0,eval, output;
// set in %B00000111, set flag 1,eval, output;


set in %B00111111,				
set flag 1,
// set address 0,
tick,
output;
tock,
output;

set in %B11001101,				
set flag 0,
// set address 0,
tick,
output;
tock,
output;


set in %B00000000,				
set flag 1,
// set address 0,
tick,
output;
tock,
output;


set in %B11111111,				
set flag 1,
// set address 0,
tick,
output;
tock,
output;


