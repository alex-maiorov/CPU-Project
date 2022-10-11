//control[0] = 0 - bitwise logic
//control[0] = 1 - arithmetic

//bitwise logic:
//control[0:2] = 000 - NOT A
//control[0:2] = 001 - AND A, B
//control[0:2] = 010 - Arithmetic SHR A by B
//control[0:1] = 011 - XOR A, B

//control[0:2] = 100 - ADD A, B (A+B)
//control[0:2] = 101 - SUB A, B (A-B)


//c <- a,b
module alu(A,//input A
B, //input B
control, //ALU Control
dout,//data out
cout //carry out
);


input A[0:32];
input B[0:32];
input control[0:2];


output dout[0:32];
output cout;

reg dout;
wire cout;



if(control[0:2] == 3'b000)begin
    assign dout = !A; //not
end

else if(control[0:2] == 3'b001)begin

    assign dout = A && B; //and

end
else if(control[0:2] == 3'b010)begin
    assign dout = (A >> B[0:5]) | ({3{A[31]}} >> B[0:5]); 

end
else if(control[0:2] == 3'b011)begin

    assign dout = A^B; //xor

end

if(control[0:2] == 3'b100)begin
    assign {cout, dout} = A+B; //add
end

else if(control[0:2] == 3'b101)begin

    assign {cout, dout} = A-B; //sub

end




endmodule





