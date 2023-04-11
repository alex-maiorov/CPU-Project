package control_types 

typedef enum logic [1:0] {DATA_BUS_ADDR_DRIVER, PC_ADDR_DRIVER};

typedef enum logic [2:0] {PC_HOLD, PC_STEP, PC_JUMP} pc_ctl_t;

typedef enum logic [3:0] {ALU_ADDR, ALU_DATA, ALU_REG_A} alu_a_select_t;

typedef enum logic [3:0] {ALU_ADDR, ALU_DATA, ALU_REG_B, ALU_IMM} alu_b_select_t;

typedef enum logic [5:0] {I_IMM, S_IMM, B_IMM, U_IMM, J_IMM} imm_encoding_format_t;

typedef enum logic [8:0] {
ALU_OP_ADD, //add
ALU_OP_SUB, //subtract
ALU_OP_SLT, //set if less than
ALU_OP_SLTU, //set if less than, unsigned
ALU_OP_AND, //bitwise and 
ALU_OP_OR, //bitwise or
ALU_OP_XOR, //bitwise xor
ALU_OP_SLL, //logic shift left
ALU_OP_SRL, //logic shift right
ALU_OP_SRA} //arithmetic shift right.
alu_control_t;


endpackage
