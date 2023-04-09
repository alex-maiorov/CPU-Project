`timescale 10us/100ns
//performs operation A/B
module div(
input [31:0] A,
input [31:0] B,
input clk,
input rst,
input signctl, //pull high to treat as twos complement signed, pull low to treat as unsigned
input remainder_out, //pull low to get quotient, pull high to get remainder
output reg [31:0] dout,
output reg drdy
);

reg [31:0] Q_intermediate;
reg [31:0] R_intermediate;

always @(*) begin
    case (remainder_out)
        1'b0: assign dout = Q_intermediate;
        1'b1: assign dout = R_intermediate;
    endcase 
    
    case ({signctl, B[31]})
        2'b00: assign drdy = (B < R_intermediate);
        2'b01: assign drdy = (B < R_intermediate);
        2'b10: assign drdy = (B < R_intermediate);
        2'b11: assign drdy = (B > R_intermediate);
    endcase
end

always @(posedge clk) begin
    case ({drdy, signctl, (B[31] ^ A[31])}) //god I hope this will work
        3'b000: begin //unsigned
            Q_intermediate = Q_intermediate + 1;
            R_intermediate = R_intermediate - B;
        end
        3'b001: begin //unsigned
            Q_intermediate = Q_intermediate + 1;
            R_intermediate = R_intermediate - B;
        end
        3'b010: begin //signed, A and B are both of the same sign
            Q_intermediate = Q_intermediate + 1;
            R_intermediate = R_intermediate - B;
        end
        3'b011: begin //signed, A and B are of different signs
            Q_intermediate = Q_intermediate - 1;
            R_intermediate = R_intermediate + B;
        end
    endcase
end

always @(posedge rst) begin
    R_intermediate = A;
    Q_intermediate = 32'h00000000;
end

endmodule;
