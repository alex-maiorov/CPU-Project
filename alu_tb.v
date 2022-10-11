`include "alu.v"

module alu_tb();

reg [32:0] a;
reg [32:0] b;
reg [3:0] control;
wire [32:0] dout;
wire cout;
reg [19:0] i;
integer index;

alu alu_test(a,
b,
control,
dout,
cout);



initial begin
	i = {19{1'b0}};
	$display ("time\t control a b dout cout");
	for(index = 0; index<2**(3+8+8); index=index+1) begin //test 4 MSBs and 4 LSBs
		i = i+1'b1;
		assign a = {i[8:5], {24{1'b0}}, i[4:0]};
		assign b = {i[16:13], {24{1'b0}}, i[12:9]};
		assign control = i[19:16];
		$display ("%g,%h,%h,%h,%h,%h", 
		$time, control, a, b, dout, cout);
		#1;
	end
end

//always @(*) begin
//	$strobe ("%g,%h,%h,%h,%h,%h", 
//		$time, control, a, b, dout, cout);
//end

endmodule
