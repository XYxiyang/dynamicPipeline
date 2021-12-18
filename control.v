`timescale 1ns / 1ps

module control(
    input is_branch,
    input [31:0] instruction,
    input [5:0] op,
    input [5:0] func,  
    output rf_wena,     
    output dmem_wena, 
    output rf_rena1,
    output rf_rena2,
    output dmem_ena,
    output dmem_w_cs,
    output dmem_r_cs,
    output ext16_sign,
    output [3:0] aluc,
    output [4:0] rd,
    output ext5_mux_sel,
    output rt_mem_mux_sel,
    output alu_mux1_sel,       
    output alu_mux2_sel,
    output [2:0] rf_mux_sel,
    output [2:0] pc_mux_sel
    );

    wire Addi = (op == 6'b001000);
    wire Addiu = (op == 6'b001001);
    wire Andi = (op == 6'b001100);
    wire Ori = (op == 6'b001101);
    wire Sltiu = (op == 6'b001011);
    wire Lui = (op == 6'b001111);
    wire Xori = (op == 6'b001110);
    wire Slti = (op == 6'b001010);
    wire Addu = (op == 6'b000000 && func==6'b100001);
    wire And = (op == 6'b000000 && func == 6'b100100);
    wire Beq = (op == 6'b000100);
    wire Bne = (op == 6'b000101);
    wire J = (op == 6'b000010);
    wire Jal = (op == 6'b000011);
    wire Jr = (op == 6'b000000 && func == 6'b001000);
    wire Lw = (op == 6'b100011);
    wire Xor = (op == 6'b000000 && func == 6'b100110);
    wire Nor = (op == 6'b000000 && func == 6'b100111);
    wire Or = (op == 6'b000000 && func == 6'b100101);
    wire Sll = (op == 6'b000000 && func == 6'b000000);
    wire Sllv = (op == 6'b000000 && func == 6'b000100);
    wire Sltu = (op == 6'b000000 && func == 6'b101011);
    wire Sra = (op == 6'b000000 && func == 6'b000011);
    wire Srl = (op == 6'b000000 && func == 6'b000010);
    wire Subu = (op == 6'b000000 && func == 6'b100011);
    wire Sw = (op == 6'b101011);
    wire Add = (op == 6'b000000 && func == 6'b100000);
    wire Sub = (op == 6'b000000 && func == 6'b100010);
    wire Slt = (op == 6'b000000 && func == 6'b101010);
    wire Srlv = (op == 6'b000000 && func == 6'b000110);
    wire Srav = (op == 6'b000000 && func == 6'b000111);
    
    wire Mul = (op == 6'b011100 && func == 6'b000010);


    assign rf_rena1 = Addi+Addiu+Andi+Ori+Sltiu+Xori+Slti+Addu+And+Beq+Bne+Jr+Lw+Xor+Nor+Or+Sllv+Sltu+Subu+Sw+Add+Sub+Slt+Srlv+Srav+Mul;
    assign rf_rena2 = Addu+And+Beq+Bne+Xor+Nor+Or+Sll+Sllv+Sltu+Sra+Srl+Subu+Sw+Add+Sub+Slt+Srlv+Srav+Mul;

    assign rf_wena = Addi+Addiu+Andi+Ori+Sltiu+Lui+Xori+Slti+Addu+And+Xor+Nor+Or+Sll+Sllv+Sltu+Sra+Srl+Subu+Add+Sub+Slt+Srlv+Srav+Lw+Mul;                                   

    assign dmem_wena = Sw;
    assign dmem_ena = Lw+Sw;
    assign dmem_w_cs = Sw;
    assign dmem_r_cs = Lw;

    assign ext16_sign = Addi+Addiu+Sltiu+Slti;
    
    assign ext5_mux_sel = Sllv+Srav+Srlv;

    assign alu_mux1_sel = ~(Sll+Srl+Sra+J+Jr+Jal);
    assign alu_mux2_sel = Slti+Sltiu+Addi+Addiu+Andi+Ori+Xori+Lw+Sw+Lui;

    assign aluc[3] = Slt+Sltu+Sllv+Srlv+Srav+Lui+Srl+Sra+Slti+Sltiu+Sll+Mul;
    assign aluc[2] = And+Or+Xor+Nor+Sll+Srl+Sra+Sllv+Srlv+Srav+Andi+Ori+Xori;
    assign aluc[1] = Add+Sub+Xor+Nor+Slt+Sltu+Sll+Sllv+Addi+Xori+Beq+Bne+Slti+Sltiu;
    assign aluc[0] = Subu+Sub+Or+Nor+Slt+Sllv+Srlv+Sll+Srl+Slti+Ori+Beq+Bne+Mul;
    
    assign rt_mem_mux_sel = ~Sw;

    assign rf_mux_sel[2] = ~(Beq+Bne+Sw+J+Jr+Jal);
    assign rf_mux_sel[1] = 0;
    assign rf_mux_sel[0] = ~(Beq+Bne+Lw+Sw+J);
    
    assign pc_mux_sel[2] = (Beq&&is_branch)+(Bne&&is_branch);
    assign pc_mux_sel[1] = ~(J+Jr+Jal+pc_mux_sel[2]);
    assign pc_mux_sel[0] = Jr;

    
    assign rd = (Add+Addu+Sub+Subu+And+Or+Xor+Nor+Slt+Sltu+Sll+Srl+Sra+Sllv+Srlv+Srav+Mul) ? 
                   instruction[15:11] : (( Addi+Addiu+Andi+Ori+Xori+Lw+Slti+Sltiu+Lui) ? 
                   instruction[20:16] : (Jal?5'd31:5'b0));

endmodule
