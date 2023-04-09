//ctl - set low to increment pc, set high to add PC and systembus_in. PC will do its thing on positive edge of step_pc
module pc(
input [31:0] systembus_in, //this will be the MSBs plus the LSBs in the jump instruction
input ctl, 
input step_pc,
output [31:0] systembus_out,
output misaligned
);

reg [31:0] pc;

assign systembus_out = pc;
assign misaligned = ~(pc[1:0] == 2'b00);

always @(posedge step_pc) begin
    case (ctl)
        1'b0: pc = pc + 32'h00000004;
        1'b1: pc = pc + systembus_in;
    endcase
end

endmodule 
