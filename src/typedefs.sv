typedef enum logic [2:0] {PC_HOLD, PC_STEP, PC_JUMP} pc_ctl_t;

typedef enum logic [3:0] {ALU_ADDR, ALU_DATA, ALU_REG} alu_a_ctl_t;

typedef enum logic [5:0] {R_IMM, I_IMM, S_IMM, B_IMM, U_IMM, J_IMM} imm_encoding_format_t;
