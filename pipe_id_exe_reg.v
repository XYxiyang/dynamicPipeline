`timescale 1ns / 1ps
`include "define.v"
module pipe_id_exe_reg(
    input clk,
    input rst,
    input wena,
    input [31:0] id_pc4,  // Next PC from ID
    input [31:0] id_rs_data_out,
    input [31:0] id_rt_data_out,
    input [31:0] id_imm,  // Immediate from ID
    input [31:0] id_shamt,
    input [4:0] id_rf_waddr,
    input id_dmem_ena,
    input [3:0] id_aluc,  // aluc from ID
    input id_rf_wena,  
    input id_dmem_wena,
    input id_dmem_w_cs,
    input id_dmem_r_cs,
    input stall,
    input id_rt_mem_mux_sel,
    input id_alu_mux1_sel,
    input id_alu_mux2_sel,
    input [2:0] id_rf_mux_sel, 
    input [5:0] id_op,
    input [5:0] id_func,
    output reg [31:0] exe_pc4,
    output reg [31:0] exe_rs_data_out,
    output reg [31:0] exe_rt_data_out,
    output reg [31:0] exe_imm,
    output reg [31:0] exe_shamt,
    output reg [4:0] exe_rf_waddr,
    output reg exe_dmem_ena,
    output reg [3:0] exe_aluc,
    output reg exe_rf_wena,  
    output reg exe_dmem_wena,
    output reg exe_dmem_w_cs,
    output reg exe_dmem_r_cs,
    output reg exe_alu_mux1_sel,
    output reg [1:0] exe_alu_mux2_sel,
    output reg exe_rt_mem_mux_sel,
    output reg [2:0] exe_rf_mux_sel,
    output reg [5:0] exe_op,
    output reg [5:0] exe_func
    );

    always @ (posedge clk or posedge rst) begin
        if(rst == `RST_ENABLED || stall == `STOP) begin
            exe_pc4 <= 32'b0;
            exe_rs_data_out <= 32'b0;
            exe_rt_data_out <= 32'b0;
            exe_imm <= 32'b0;
            exe_shamt <= 32'b0;
            exe_rf_waddr <= 5'b0;
            exe_dmem_ena <= 1'b0;
            exe_aluc <= 4'b0;
            exe_rf_wena <= 1'b0;
            exe_dmem_wena <= 1'b0;
            exe_dmem_w_cs <= 2'b0;
            exe_dmem_r_cs <= 2'b0;
            exe_alu_mux1_sel <= 1'b0;
            exe_alu_mux2_sel <= 1'b0;
            exe_rf_mux_sel <= 3'b0;
            exe_rt_mem_mux_sel <= 1'b0;
            exe_op <= 6'b0;
            exe_func <= 6'b0;
        end
        
        else if(wena == `WRITE_ENABLED) begin
            exe_pc4 <= id_pc4;
            exe_rs_data_out <= id_rs_data_out;
            exe_rt_data_out <= id_rt_data_out;
            exe_imm <= id_imm;
            exe_shamt <= id_shamt;
            exe_rf_waddr <= id_rf_waddr;
            exe_dmem_ena <= id_dmem_ena;
            exe_aluc <= id_aluc;
            exe_rf_wena <= id_rf_wena;
            exe_dmem_wena <= id_dmem_wena;
            exe_dmem_w_cs <= id_dmem_w_cs;
            exe_dmem_r_cs <= id_dmem_r_cs;
            exe_alu_mux1_sel <= id_alu_mux1_sel;
            exe_alu_mux2_sel <= id_alu_mux2_sel;
            exe_rf_mux_sel <= id_rf_mux_sel;
            exe_op <= id_op;
            exe_func <= id_func;
            exe_rt_mem_mux_sel <= id_rt_mem_mux_sel;
        end
    end 

endmodule