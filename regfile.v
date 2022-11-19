module regfile(
input [0:31] systembus_in,
input [0:4] select_write,
input [0:4] select_sbus,
input [0:4] select_alu,
output [0:31] systembus_out,
output [0:31] alu_out);

reg [0:31] x1;
reg [0:31] x2;
reg [0:31] x3;
reg [0:31] x4;
reg [0:31] x5;
reg [0:31] x6;
reg [0:31] x7;
reg [0:31] x8;
reg [0:31] x9;
reg [0:31] x10;
reg [0:31] x11;
reg [0:31] x12;
reg [0:31] x13;
reg [0:31] x14;
reg [0:31] x15;
reg [0:31] x16;
reg [0:31] x17;
reg [0:31] x18;
reg [0:31] x19;
reg [0:31] x20;
reg [0:31] x21;
reg [0:31] x22;
reg [0:31] x23;
reg [0:31] x24;
reg [0:31] x25;
reg [0:31] x26;
reg [0:31] x27;
reg [0:31] x28;
reg [0:31] x29;
reg [0:31] x30;
reg [0:31] x31;

always @(*) begin
    case(select_write)
        5'd01: x1 = systembus_in;
        5'd02: x2 = systembus_in;
        5'd03: x3 = systembus_in;
        5'd04: x4 = systembus_in;
        5'd05: x5 = systembus_in;
        5'd06: x6 = systembus_in;
        5'd07: x7 = systembus_in;
        5'd08: x8 = systembus_in;
        5'd09: x9 = systembus_in;
        5'd10: x10 = systembus_in;
        5'd11: x11 = systembus_in;
        5'd12: x12 = systembus_in;
        5'd13: x13 = systembus_in;
        5'd14: x14 = systembus_in;
        5'd15: x15 = systembus_in;
        5'd16: x16 = systembus_in;
        5'd17: x17 = systembus_in;
        5'd18: x18 = systembus_in;
        5'd19: x19 = systembus_in;
        5'd20: x20 = systembus_in;
        5'd21: x21 = systembus_in;
        5'd22: x22 = systembus_in;
        5'd23: x23 = systembus_in;
        5'd24: x24 = systembus_in;
        5'd25: x25 = systembus_in;
        5'd26: x26 = systembus_in;
        5'd27: x27 = systembus_in;
        5'd28: x28 = systembus_in;
        5'd29: x29 = systembus_in;
        5'd30: x30 = systembus_in;
        5'd31: x31 = systembus_in;
    endcase
    case(select_alu)
        5'd00: alu_out = 32'h00000000;
        5'd01: alu_out = x1;
        5'd02: alu_out = x2;
        5'd03: alu_out = x3;
        5'd04: alu_out = x4;
        5'd05: alu_out = x5;
        5'd06: alu_out = x6;
        5'd07: alu_out = x7;
        5'd08: alu_out = x8;
        5'd09: alu_out = x9;
        5'd10: alu_out = x10;
        5'd11: alu_out = x11;
        5'd12: alu_out = x12;
        5'd13: alu_out = x13;
        5'd14: alu_out = x14;
        5'd15: alu_out = x15;
        5'd16: alu_out = x16;
        5'd17: alu_out = x17;
        5'd18: alu_out = x18;
        5'd19: alu_out = x19;
        5'd20: alu_out = x20;
        5'd21: alu_out = x21;
        5'd22: alu_out = x22;
        5'd23: alu_out = x23;
        5'd24: alu_out = x24;
        5'd25: alu_out = x25;
        5'd26: alu_out = x26;
        5'd27: alu_out = x27;
        5'd28: alu_out = x28;
        5'd29: alu_out = x29;
        5'd30: alu_out = x30;
        5'd31: alu_out = x31;
    endcase
    case(select_sbus)
        5'd00: systembus_out = 32'h00000000;
        5'd01: systembus_out = x1;
        5'd02: systembus_out = x2;
        5'd03: systembus_out = x3;
        5'd04: systembus_out = x4;
        5'd05: systembus_out = x5;
        5'd06: systembus_out = x6;
        5'd07: systembus_out = x7;
        5'd08: systembus_out = x8;
        5'd09: systembus_out = x9;
        5'd10: systembus_out = x10;
        5'd11: systembus_out = x11;
        5'd12: systembus_out = x12;
        5'd13: systembus_out = x13;
        5'd14: systembus_out = x14;
        5'd15: systembus_out = x15;
        5'd16: systembus_out = x16;
        5'd17: systembus_out = x17;
        5'd18: systembus_out = x18;
        5'd19: systembus_out = x19;
        5'd20: systembus_out = x20;
        5'd21: systembus_out = x21;
        5'd22: systembus_out = x22;
        5'd23: systembus_out = x23;
        5'd24: systembus_out = x24;
        5'd25: systembus_out = x25;
        5'd26: systembus_out = x26;
        5'd27: systembus_out = x27;
        5'd28: systembus_out = x28;
        5'd29: systembus_out = x29;
        5'd30: systembus_out = x30;
        5'd31: systembus_out = x31;
    endcase
    
end



endmodule
