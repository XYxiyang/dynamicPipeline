`timescale 1ns / 1ps

module pipe_mem(
    input clk,
    input [31:0] alu_out, 
    input [31:0] pc4,
    input [31:0] rs_data_out,
    input [31:0] rt_data_out,
    input [4:0] rf_waddr,
    input dmem_ena,
    input rf_wena,         
    input dmem_wena,
    input dmem_w_cs,
    input dmem_r_cs,
    input rt_mem_mux_sel,
    input [2:0] rf_mux_sel, 
    input [5:0] pos,
    output [31:0] mem_alu_out,  // Result of ALU
    output [31:0] mem_dmem_out,
    output [31:0] mem_pc4,
    output [31:0] mem_rs_data_out,
    output [4:0] mem_rf_waddr,
    output mem_rf_wena,          
    output [2:0] mem_rf_mux_sel,
    output [31:0] final,
    output [31:0] show
    );

    wire [31:0] dmem_out;
    wire [31:0] rt_mem;

    assign mem_pc4 = pc4;
    assign mem_rs_data_out = rs_data_out;
    assign mem_alu_out = alu_out;
    assign mem_rf_waddr = rf_waddr;
    assign mem_rf_wena = rf_wena;
    assign mem_rf_mux_sel = rf_mux_sel;

    mux_2_32 mem_rt_mux(
        .C0(rt_data_out),
        .C1(dmem_out),
        .S0(rt_mem_mux_sel),
        .oZ(mem_dmem_out)
    );

    assign show[0]= dmem_w_cs;

    dmem cpu_dmem(
        .clk(clk),
        .ena(dmem_ena),
        .wena(dmem_wena),
        .w_cs(dmem_w_cs),
        .r_cs(dmem_r_cs),
        .pos(pos),
        .data_in(mem_dmem_out),
        .addr(alu_out),
        .data_out(dmem_out),
        .final(final)
    );

endmodule