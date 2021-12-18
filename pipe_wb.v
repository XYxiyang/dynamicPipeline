///////////////////////////////////////////////////////////////////////////////
// Author: Zirui Wu
// Type: Module
// Project: MIPS Pipeline CPU 54 Instructions
// Description: Write back module
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module pipe_wb(
    input [31:0] alu_out,
    input [31:0] dmem_out, 
    input [31:0] pc4,
    input [31:0] rs_data_out,
    input [4:0] rf_waddr,
    input rf_wena,       
    input [2:0] rf_mux_sel, 
    output [31:0] rf_wdata,
    output [4:0] wb_rf_waddr,
    output wb_rf_wena
    );


    // MUX for regfile
    mux_8_32 mux_rf(
        .C0(32'b0),
        .C1(pc4),
        .C2(32'b0),
        .C3(32'b0),
        .C4(dmem_out),
        .C5(alu_out),
        .C6(32'b0),
        .C7(32'b0),
        .S0(rf_mux_sel),
        .oZ(rf_wdata)
    );

    assign wb_rf_waddr = rf_waddr;
    assign wb_rf_wena = rf_wena;

endmodule