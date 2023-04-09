module programmable_register #(parameter width = 32) (
input logic Clk, Ld, Clear,
input logic [width-1:0] data_in,
output logic [width-1:0] data_out
);

logic [width-1:0] register;

always_ff @(posedge Clk) begin
    if(Clear = 1'b1) begin
        register <= {width{1'b0}};
    end
    else if(Ld == 1'b1) begin
        register <= data_in;
    end
end
