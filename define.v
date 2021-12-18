`define ENABLED              1'b1
`define DISABLED             1'b0
`define RST_ENABLED          1'b1
`define RST_DISABLED         1'b0
`define READ_ENABLED         1'b1
`define READ_DISABLED        1'b0
`define WRITE_ENABLED        1'b1
`define WRITE_DISABLED       1'b0
`define CHIP_ENABLED         1'b1
`define CHIP_DISABLED        1'b0
`define SIGNED               1'b1
`define UNSIGNED             1'b0

`define ZERO_32BIT           32'h00000000

`define EXCEPTION_ADDR       32'h00400004

// Stall
`define STOP                1'b1
`define RUN                 1'b0


// Instructions Operand
`define ADDI_OP      6'b001000
`define ADDIU_OP     6'b001001
`define ANDI_OP      6'b001100
`define ORI_OP       6'b001101
`define SLTIU_OP     6'b001011
`define LUI_OP       6'b001111
`define XORI_OP      6'b001110
`define SLTI_OP      6'b001010
`define ADDU_OP      6'b000000
`define AND_OP       6'b000000
`define BEQ_OP       6'b000100
`define BNE_OP       6'b000101
`define J_OP         6'b000010
`define JAL_OP       6'b000011
`define JR_OP        6'b000000
`define LW_OP        6'b100011
`define XOR_OP       6'b000000
`define NOR_OP       6'b000000
`define OR_OP        6'b000000
`define SLL_OP       6'b000000
`define SLLV_OP      6'b000000
`define SLTU_OP      6'b000000
`define SRA_OP       6'b000000
`define SRL_OP       6'b000000
`define SUBU_OP      6'b000000
`define SW_OP        6'b101011
`define ADD_OP       6'b000000
`define SUB_OP       6'b000000
`define SLT_OP       6'b000000
`define SRLV_OP      6'b000000
`define SRAV_OP      6'b000000
`define MUL_OP       6'b011100

// Instruction Func
`define ADDU_FUNC      6'b100001
`define AND_FUNC       6'b100100
`define JR_FUNC        6'b001000
`define XOR_FUNC        6'b100110
`define NOR_FUNC       6'b100111
`define OR_FUNC        6'b100101
`define SLL_FUNC       6'b000000
`define SLLV_FUNC      6'b000100
`define SLTU_FUNC      6'b101011
`define SRA_FUNC       6'b000011
`define SRL_FUNC       6'b000010
`define SUBU_FUNC      6'b100011
`define ADD_FUNC       6'b100000
`define SUB_FUNC       6'b100010
`define SLT_FUNC       6'b101010
`define SRLV_FUNC      6'b000110
`define SRAV_FUNC      6'b000111
`define MUL_FUNC       6'b000010
