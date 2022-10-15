`timescale 10us/100ns
module mul(input [31:0] A,
input [31:0] B,
input clk,
input rst, //pull high to reset multiplication state machine
input signctl, //pull high to treat as twos complement signed, pull low to treat as unsigned
input upper, //pull high to get 32 MSBs from multiplication, pull low to get 32 LSBs from multiplication
output reg [31:0] dout,
output drdy
);

reg [63:0] intermediate;
reg [4:0] counter;


assign drdy = {counter == 5'b11111} | {{B & {32'hFFFFFFFF << counter}} == 32'h00000000};

always @(posedge rst) begin
    {counter[4:0], intermediate[63:0]} = {69{1'b0}};
end

always @(posedge clk) begin
    //$display ("Counter; %h", counter);
    case ({signctl, B[31]})
        2'b00 : intermediate = intermediate + {{{32'h00000000, A} << {counter}} & {64{B[counter +: 1]}}}; 
        2'b01 : intermediate = intermediate + {{{32'h00000000, A} << {counter}} & {64{B[counter +: 1]}}};
        2'b10 : intermediate = intermediate + {{{32'h00000000, A} << {counter}} & {64{B[counter +: 1]}}};
        2'b11 : intermediate = intermediate + {{{32'h00000000, {-A}} << {counter}} & {64{{-B}[counter +: 1]}}};
    endcase
    //$display("%h", intermediate);
    case (upper)
        1'b0 : assign dout = intermediate[31:0];
        1'b1 : assign dout = intermediate[63:32];
    endcase
    
    counter = counter + 1'b1;
end

endmodule

