`timescale 1ns / 1ps
`include "define.v"
module pipe_mem_wb_reg(
    input clk,
    input rst,
    input wena,
    input [31:0] mem_alu_out,
    input [31:0] mem_dmem_out, 
    input [31:0] mem_pc4,
    input [31:0] mem_rs_data_out,
    input [4:0] mem_rf_waddr,
    input mem_rf_wena,       
    input [2:0] mem_rf_mux_sel, 
    output reg [31:0] wb_alu_out,
    output reg [31:0] wb_dmem_out, 
    output reg [31:0] wb_pc4,
    output reg [31:0] wb_rs_data_out,
    output reg [4:0] wb_rf_waddr,
    output reg wb_rf_wena,
    output reg [2:0] wb_rf_mux_sel
    );

    always @ (posedge clk or posedge rst) 
    begin
        if(rst == `RST_ENABLED) begin
            wb_alu_out <= 0;
            wb_dmem_out <= 0;
            wb_pc4 <= 0;
            wb_rs_data_out <= 0;
            wb_rf_waddr <= 0;
            wb_rf_wena <= 0;
            wb_rf_mux_sel <= 0;
        end

        else if(wena == `WRITE_ENABLED) begin
            wb_alu_out <= mem_alu_out;
            wb_dmem_out <= mem_dmem_out;
            wb_pc4 <= mem_pc4;
            wb_rs_data_out <= mem_rs_data_out;
            wb_rf_waddr <= mem_rf_waddr;
            wb_rf_wena <= mem_rf_wena;
            wb_rf_mux_sel <= mem_rf_mux_sel;
        end
    end 

endmodule