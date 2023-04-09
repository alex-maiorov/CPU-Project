module sram(
input [31:0] addr, //little endian
input rw, //set 1 for read, set 0 for write
output [31:0] data, //undefined for rw set to 0
output [2:0] status, //bit 0 is set to 1 when a transaction begins and is set to 0 when data is ready. bit 1 is set high when a transaction is invalid
);
