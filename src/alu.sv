import types::*;

module alu (input logic [31:0] A,//input A
input logic [31:0] B, //input B
input alu_control_t alu_control, //ALU Control
output logic [31:0] dout,//data out
output logic cout //carry out
);

always_comb begin
	case (alu_control)
		ALU_OP_ADD: {cout, dout} = A+B;
		ALU_OP_SUB: {cout, dout} = A-B;
		ALU_OP_SLT: dout = {{31{1'b0}}, (A-B)[31]};
		ALU_OP_SLTU: dout={{31{1'b0}}, (A<B)};
		ALU_OP_AND: dout = A & B;
		ALU_OP_OR:  dout = A | B;
		ALU_OP_XOR: dout = A ^ B;
		ALU_OP_SLL: dout = A<<B[5:0];
		ALU_OP_SRL: dout = A>>B[5:0];
		ALU_OP_SRA: dout = (A >> B[5:0]) | ({3{A[31]}} >> B[5:0]);
	endcase
end



endmodule





