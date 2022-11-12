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
module alu(input[31:0] A,//input A
input[31:0] B, //input B
input[2:0] control, //ALU Control
output reg [31:0] dout,//data out
output reg cout //carry out
);







always @(*) begin
	if(control[2:0] == 3'b000)begin
	    assign dout = ~A; //not
	end

	else if(control[2:0] == 3'b001)begin

	    assign dout = A & B; //and

	end
	else if(control[2:0] == 3'b010)begin
	    assign dout = (A >> B[5:0]) | ({3{A[31]}} >> B[5:0]); 

	end
	else if(control[2:0] == 3'b011)begin

	    assign dout = A^B; //xor

	end
	else if(control[2:0] == 3'b100)begin
	    assign {cout, dout} = A+B; //add
	end

	else if(control[2:0] == 3'b101)begin

	    assign {cout, dout} = A-B; //sub
	end
end



endmodule





