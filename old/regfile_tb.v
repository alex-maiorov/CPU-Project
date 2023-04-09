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

reg [4:0] i;

integer index;

wire ok;

regfile regfile_test(
sbus_in,
write_select,
sbus_select,
alu_select,
sbus_out,
alu_out);

assign ok = (~(temp_a^temp_b) == 32'hFFFFFFFF);

initial begin
	i = {5{1'b0}};
	$display ("time,sbus_in, write_select,alu_select,sbus_select,sbus_out,alu_out, ok");
	for(index = 0; index<2**(4); index=index+1) begin
		
		sbus_in = $random;
		temp_a = sbus_in;
		write_select = i;
		#5;
		write_select = {5{1'b0}};
		#5;
		sbus_in = {32{1'b0}};
		sbus_select = i;
		#5
		temp_b = sbus_out;
		$display ("%g,%h,%h,%h,%h,%h,%h,%b",
		$time, sbus_in, write_select, alu_select, sbus_select, sbus_out, alu_out, ok);
		i = i+1'b1;
	end
	
	i = {5{1'b0}};
	//$display ("time,sbus_in, write_select,alu_select,sbus_select,sbus_out,alu_out");
	for(index = 0; index<2**(4); index=index+1) begin
		
		sbus_in = $random;
		temp_a = sbus_in;
		write_select = i;
		#5;
		write_select = {5{1'b0}};
		#5;
		sbus_in = {32{1'b0}};
		alu_select = i;
		#5
		temp_b = alu_out;
		$display ("%g,%h,%h,%h,%h,%h,%h,%b",
		$time, sbus_in, write_select, alu_select, sbus_select, sbus_out, alu_out, ok);
		i = i+1'b1;
	end
end

//always @(*) begin
//	$strobe ("%g,%h,%h,%h,%h,%h", 
//		$time, control, a, b, dout, cout);
//end

endmodule
