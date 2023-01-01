//performs operation A/B
module div(
input [31:0] A,
input [31:0] B,
input clk,
input rst,
input signctl, //pull high to treat as twos complement signed, pull low to treat as unsigned
input remainder_out, //pull low to get quotient, pull high to get remainder
)

reg [31:0] Q_intermediate;
reg [31:0] R_intermediate;

assign Q = Q_intermediate;
assign R = R_intermediate;

assign drdy = (R_intermediate > B)

always @(posedge clk) begin
    case {(R_intermediate < B), B[31]
        1'b1: begin
            R_intermediate = R_intermediate - B;
            Q_intermediate = Q_intermediate + 1;
        end
    endcase
end

always @(posedge rst) begin
    R_intermediate = A;
    Q_intermediate = 32'h00000000;
endmodule;
