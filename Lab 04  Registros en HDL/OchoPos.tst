load OchoPos.hdl;
output-file OchoPos.out;
output-list in flag address out;

set in %B01101100,				
set flag 1,
set address %B001,
// set address 0,
tick,
output;
tock,
output;


set in %B00110000,				
set flag 1,
set address %B010,
// set address 0,
tick,
output;
tock,
output;



set in %B11111111,				
set flag 1,
set address %B011,
// set address 0,
tick,
output;
tock,
output;



set in %B01011010,				
set flag 1,
set address %B110,
// set address 0,
tick,
output;
tock,
output;
