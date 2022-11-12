// ctl[1] - set high to connect pc to to system bus output
// ctl[0] - set low to increment pc, set high to add system bus to pc
module pc(
input [31:0] systembus_in,
input [1:0] ctl, 
input step_pc,
output [31:0] systembus_out,
)

reg [31:0] pc;

always @(posedge step_pc) begin
    case (ctl[0])
        1'b0: pc = pc + 32'h00000004;
        1'b1: pc = pc + systembus_in
    endcase
end

always @(*) begin
    
end

endmodule 
