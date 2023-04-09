module regfile(
input logic [0:31] write_input,
input logic [0:4] select_write,
input logic [0:4] select_read_A,
input logic [0:4] select_read_B,
output logic [0:31] A_out,
output logic [0:31] B_out);

logic [31:0] registers [31];

always_comb begin
    case (select_write) begin
        5'b00000: ;
        default: registers[select_write -1] <= write_input;
    endcase
    
    case (select_read_A) begin
        5'b00000: A_out = 32'h00000000;
        default: A_out <= registers[select_write -1];
    endcase
    
    case (select_read_B) begin
        5'b00000: B_out = 32'h00000000;
        default: B_out <= registers[select_write -1];
    endcase
end



endmodule
