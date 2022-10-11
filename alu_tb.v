`include "alu.v"

module alu_tb();

reg a[0:32], b[0:32], control[0:3];
wire dout[0:32], cout;

initial begin
$display ("time\t control a b dout cout");

$monitor ("%g,%h,%h,%h,%h,%h", 
    $time, control, a, b, dout, cout);
end

always begin
    for(int i=0; i<2**67; i=i+1) begin
    {control,a,b} = i;
    #10;
    end
end

alu alu_U(a,
b,
control,
dout,
cout);

endmodule
