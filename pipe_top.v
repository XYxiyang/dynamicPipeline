`timescale 1ns / 1ps


module pipe_top(
    input clk,
    input rst,
    input stop,
    input mode,
    input [5:0]pos,
    //output [31:0] instruction,
    //output [31:0] pc,

    output [7:0] o_seg,
    output [7:0] o_sel
    );

    parameter T1s = 19_999_99;
    wire [31:0] instruction;
    wire [31:0] pc;
    wire [31:0] final;

    reg [30:0] count;
    reg clk_1s;

    wire [31:0] seg7_in;

    always @ (posedge clk or posedge rst) 
    begin
        if(rst) begin
            clk_1s <= 0;
            count <= 0;
        end
        else if(count == T1s) begin
            count <= 0;
            clk_1s <= ~clk_1s;
        end
        else
            count <= count + 1;
    end

    cpu_top cpu(
        .clk(clk_1s),
        .rst(rst),
        .pos(pos),
        .mode(mode),
        .instruction(instruction),
        .pc(pc),
        .final(final),
        .stop(stop)
    );

    assign seg7_in=final;

    seg7x16 seg7(clk, rst, 1, seg7_in, o_seg, o_sel);

endmodule
