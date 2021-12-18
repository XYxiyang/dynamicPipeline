///////////////////////////////////////////////////////////////////////////////
// Author: Zirui Wu
// Type: Module
// Project: MIPS Pipeline CPU 54 Instructions
// Description: Data Memory
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

`include "define.v"

module dmem (
    input clk,
    input ena,
    input wena,
    input w_cs,
    input r_cs,
    input [5:0]pos, 
    input [31:0] data_in,
    input [31:0] addr,
    output reg [31:0] data_out,

    output [31:0] final
    );


    reg [31:0] temp [1023:0];

    // Write
    always @ (posedge clk) 
    begin
        if(ena == `ENABLED) begin
            if(wena == `WRITE_ENABLED) begin
                if(w_cs == 1) begin
                    temp[(addr - 32'h10010000) / 4] <= data_in;
                end
            end
        end
    end
    
    // Read
    always @ (*) 
    begin
        if(ena == `ENABLED && wena == `WRITE_DISABLED) begin
            if(r_cs == 1) begin
                data_out <= temp[(addr - 32'h10010000) / 4];
            end
        end
    end
    
    assign final=temp[180+pos];
endmodule