`timescale 1ns / 1ps
`include "define.v"


module pipe_exe_mem_reg(
    input clk,
    input rst,
    input wena,
    input [31:0] exe_alu_out, 
    input [31:0] exe_pc4,
    input [31:0] exe_rs_data_out,
    input [31:0] exe_rt_data_out,
    input [4:0] exe_rf_waddr,
    input exe_dmem_ena,
    input exe_rf_wena,       
    input exe_dmem_wena,
    input exe_dmem_w_cs,
    input exe_dmem_r_cs,
    input exe_rt_mem_mux_sel,
    input [2:0] exe_rf_mux_sel, 
    output reg [31:0] mem_alu_out, 
    output reg [31:0] mem_pc4,
    output reg [31:0] mem_rs_data_out,
    output reg [31:0] mem_rt_data_out,
    output reg [4:0] mem_rf_waddr,
    output reg mem_dmem_ena,
    output reg mem_rf_wena,       
    output reg mem_dmem_wena,
    output reg mem_dmem_w_cs,
    output reg mem_dmem_r_cs,
    output reg mem_rt_mem_mux_sel,
    output reg [2:0] mem_rf_mux_sel
    );

    always @ (posedge clk or posedge rst) 
    begin
        if(rst == `RST_ENABLED) begin
            mem_alu_out <= 0;
            mem_pc4 <= 0;
            mem_rs_data_out <= 0;
            mem_rt_data_out <= 0;
            mem_rf_waddr <= 0;
            mem_dmem_ena <= 0;
            mem_rf_wena <= 0;
            mem_dmem_wena <= 0;
            mem_dmem_w_cs <= 0;
            mem_dmem_r_cs <= 0;
            mem_rf_mux_sel <= 0;
            mem_rt_mem_mux_sel <= 0;
        end

        else if(wena == `WRITE_ENABLED) begin
            mem_alu_out <= exe_alu_out;
            mem_pc4 <= exe_pc4;
            mem_rs_data_out <= exe_rs_data_out;
            mem_rt_data_out <= exe_rt_data_out;
            mem_rf_waddr <= exe_rf_waddr;
            mem_dmem_ena <= exe_dmem_ena;
            mem_rf_wena <= exe_rf_wena;
            mem_dmem_wena <= exe_dmem_wena;
            mem_dmem_w_cs <= exe_dmem_w_cs;
            mem_dmem_r_cs <= exe_dmem_r_cs;
            mem_rf_mux_sel <= exe_rf_mux_sel;
            mem_rt_mem_mux_sel <= exe_rt_mem_mux_sel;
        end
    end 

endmodule