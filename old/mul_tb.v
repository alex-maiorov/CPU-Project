`include "mul.v"
`timescale 10us/100ns
module mul_tb();

reg [31:0] a;
reg [31:0] b;
reg clk;
reg rst;
reg signctl;
reg upper; 
wire [31:0] dout;
wire drdy;
reg [17:0] i;
integer index;

mul mul_test(a,
b,
clk,
rst,
signctl,
upper,
dout,
drdy);



initial begin
	$display ("BEGIN CSV mul");
	clk = 1'b0;
	rst = 1'b1;
	#5;
	rst = 0'b0; //reset multiplication circuit before starting
	i = {19{1'b0}};
	$display ("time, clk, rst, signctl, upper, a, b, dout, drdy");
	index = 0;
	while(index<2**(2+8+8)) begin //test 4 MSBs and 4 LSBs

		a = {i[7:4], {24{1'b0}}, i[3:0]};
		b = {i[15:12], {24{1'b0}}, i[11:8]};

		signctl = i[16];
		upper = i[17];
		// a = 32'h00000006;
		// b = 32'h00000006;
		// signctl = 1'b0;
		// upper = 1'b0;
		
		#5;
		// $display ("%g,%h,%h,%h,%h,%h,%h,%h,%h", 
		// $time, clk, rst, signctl, upper, a, b, dout, drdy);
		if(drdy == 1'b1) begin

			
			$display ("%g,%h,%h,%h,%h,%h,%h,%h,%h", 
			$time, clk, rst, signctl, upper, a, b, dout, drdy);
			index = index + 1;
			i = i + 1'b1;
			rst = 1'b1;
			#5;

			rst = 1'b0;
			// $finish;
		end
	end
	$display ("END CSV mul");
	$finish;
end

always begin
	#5 clk = ~clk;
end
//always @(*) begin
//	$strobe ("%g,%h,%h,%h,%h,%h", 
//		$time, control, a, b, dout, cout);
//end

endmodule
