`include "regfile.v"

module alu_tb();

reg [31:0] sbus_in;
reg [4:0] write_select;
reg [4:0] alu_select;
reg [4:0] sbus_select;

wire [31:0] sbus_out;
wire [31:0] alu_out;

reg [31:0] temp_a;
reg [31:0] temp_b;

wire ok;

regfile regfile_test(
sbus_in,
write_select,
sbus_select,
alu_select,
sbus_out,
alu_out)

assign ok = (~(a^b) == 32'hFFFFFFFF);

initial begin
	i = {12{1'b0}};
	$display ("time,sbus_in, write_select,alu_select,sbus_select,sbus_out,alu_out");
	for(index = 0; index<2**(4); index=index+1) begin
		
		
		#5;
		$display ("%g,%h,%h,%h,%h,%h",  
		$time, control, a, b, dout, cout);
		i = i+1'b1;
	end
end

//always @(*) begin
//	$strobe ("%g,%h,%h,%h,%h,%h", 
//		$time, control, a, b, dout, cout);
//end

endmodule
