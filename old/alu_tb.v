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
	$display ("BEGIN CSV alu");
	i = {21{1'b0}};
	$display ("time,control,a,b,dout,cout");
	for(index = 0; index<2**(5+8+8); index=index+1) begin //test 4 MSBs and 4 LSBs
		
		assign a = {i[8:5], {24{i[4]}}, i[3:0]};
		assign b = {i[17:14], {24{i[13]}}, i[12:9]};
		assign control = i[21:18];
		#10;
		$display ("%g,%h,%h,%h,%h,%h", 
		$time, control, a, b, dout, cout);
		i = i+1'b1;
	end
	$display ("END CSV alu");
end

//always @(*) begin
//	$strobe ("%g,%h,%h,%h,%h,%h", 
//		$time, control, a, b, dout, cout);
//end

endmodule
