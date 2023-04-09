module imm_extender(
input logic [31:0] inst,
imm_encoding_format_t format,
output logic [31:0] IMM);

always_comb begin
    case(format)
    I_IMM: IMM = {{21{inst[31]}}, inst[30:25], inst[24:21], inst[20]};
    S_IMM: IMM = {{21{inst[31]}}, inst[30:25], inst[11:8], inst[7]};
    B_IMM: IMM = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
    U_IMM: IMM = {inst[31], inst[30:20], inst[19:12], 12'h000};
    J_IMM: IMM = {{11{inst[31}}, inst[19:12], inst[20], inst[30:25], inst[24:21]};
    default: IMM = 32'h00000000;
end
endmodule
