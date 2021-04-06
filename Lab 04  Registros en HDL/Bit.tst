load Bit.hdl;
output-file Bit.out;
output-list in load out;


set in 1,				
set load 1,
// set address 0,
tick,
output;
tock,
output;

set in 1,				
set load 0,
// set address 0,
tick,
output;
tock,
output;


set in 0,				
set load 1,
// set address 0,
tick,
output;
tock,
output;