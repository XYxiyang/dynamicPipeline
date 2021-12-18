`timescale 1ns / 1ps

module extend_5_32 (
    input [4:0] a,
    output [31:0] b
    );

    assign b = {27'b0, a};
    
endmodule

module extend_16_32 (
    input [15:0] data_in,
    input sign,
    output [31:0] data_out
    );

    assign data_out = (sign == 0 || data_in[15] == 0) ? {16'b0, data_in} : {16'hffff, data_in};
    
endmodule

module extend_sign_18_32 (
    input [17:0] data_in,
    output [31:0] data_out
    );

    assign data_out = (data_in[17] == 0) ? {14'b0, data_in} : {14'b11111111111111, data_in};
    
endmodule