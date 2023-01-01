`include "alu.v"

module alu_tb();

reg [31:0] a;
reg [31:0] b;
reg [2:0] control;
wire [31:0] dout;
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
	$display ("time,control,a,b,dout,cout");
	for(index = 0; index<2**(3+8+8); index=index+1) begin //test 4 MSBs and 4 LSBs
		
		assign a = {i[7:4], {24{1'b0}}, i[3:0]};
		assign b = {i[15:12], {24{1'b0}}, i[11:8]};
		assign control = i[19:16];
		#10;
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
