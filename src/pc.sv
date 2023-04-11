//ctl - set low to increment pc, set high to add PC and systembus_in. PC will do its thing on positive edge of step_pc

//typedef enum logic [1:0] {PC_HOLD, PC_STEP, PC_JUMP} pc_ctl_t;

module pc(
input logic Clk,
input logic [31:0] addr_in, //this will be the MSBs plus the LSBs in the jump instruction
pc_ctl_t pc_ctl, 
output logic [31:0] addr_out,
output logic misaligned
);

logic [31:0] pc;

assign systembus_out = pc;
assign misaligned = ~(pc[1:0] == 2'b00);

always_ff @(posedge Clk) begin
    case (pc_ctl)
        PC_STEP: pc <= pc + 32'h00000004;
        PC_JUMP: pc <= pc + systembus_in;
        PC_HOLD: pc = pc;
    endcase
end

endmodule 
