`import "alu.v" 
`import "regfile.v"
`import "pc.v"

//system bus output FSM:
//00 - PC address
//01 - Memory controller
//10 - FSM
//11 - ALU

//system bus input FSM:
//000 - PC input
//001 - Memory controller
//010 - FSM
//011 - ALU
//100 - Register file
//101 - undefined
//110 - undefined
//111 - undefined

//memory controller control:
//00 - read, address on system bus
//01 - output result to system bus
//10 - write, address on system bus
//11 - write, data on system bus

//there is a memory clock bit that is set high to get the memory controller to do stuff

//memory controller output:
//00 - awaiting address
//01 - awaiting data
//10 - data ready(reading)
//11 - data written

//PC control(bit 0 step, bit 1 control)
//0 - increment PC on step_pc positive edge
//1 - add system bus to PC on step_pc positive edge

//register file mapping
//write_select is mapped to ir[11:6]
//alu_select is mapped to ir[19:15]
//systembus_select is mapped to ir[24:20]
//all mappings may be set to x0 if that mapping is unnecessary

reg [31:0] ir; //instruction register
reg [1:0] systembus_output_ctl;
reg [2:0] systembus_input_ctl;
reg [1:0] memory_controller_ctl;

regfile rv_regfile(

)

alu rv_alu(

)

pc rv_pc(

)


