load SixTeenPos.hdl;
output-file SixTeenPos.out;
output-list in flag addressBit address8Pos out;

set in %B10101010,				
set flag 1,
set addressBit 1,
set address8Pos %B000,
tick,
output;
tock,
output;

// lee datos
set in %B110011,				
set flag 0,
set addressBit 1,
set address8Pos %B000,
tick,
output;
tock,
output;



set in %B11111111,				
set flag 1,
set addressBit 1,
set address8Pos %B000,
tick,
output;
tock,
output;


set in %B11100111,				
set flag 1,
set addressBit 0,
set address8Pos %B111,
tick,
output;
tock,
output;


set in %B11100010,				
set flag 1,
set addressBit 1,
set address8Pos %B011,
tick,
output;
tock,
output;


set in %B00000000,				
set flag 1,
set addressBit 0,
set address8Pos %B110,
tick,
output;
tock,
output;

// lee datos
set in %B110011,				
set flag 0,
set addressBit 1,
set address8Pos %B000,
tick,
output;
tock,
output;



set in %B11111111,				
set flag 0,
set addressBit 1,
set address8Pos %B101,
tick,
output;
tock,
output;