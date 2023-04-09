module rv32_core(
input logic Clk, Reset, memory_drdy,
inout logic [32:0] memory_data,
output logic [32:0] memory_addr,
)

logic Ld_IR
logic [4:0] sr1, sr2, dr; //set dr to 5'b00000 to not load reg
logic [32:0] MAR, MDR, IR, address_bus, data_bus, IMM, 

programmable_register #(32) instruction_register(.* .data_in(data_bus), .Ld(Ld_IR), .Clr(Reset), .data_out(IR)) //IR

