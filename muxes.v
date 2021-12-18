`timescale 1ns / 1ns

module mux_2_5(
    input [4:0] C0,
    input [4:0] C1,
    input S0,
    output reg [4:0] oZ
    );

    always @ (C0 or C1 or S0) begin
        case(S0)
            1'b0: oZ <= C0;
            1'b1: oZ <= C1;
        endcase
    end
endmodule


module mux_2_32(
    input [31:0] C0,
    input [31:0] C1,
    input S0,
    output reg [31:0] oZ
    );

    always @ (C0 or C1 or S0) begin
        case(S0)
            1'b0: oZ <= C0;
            1'b1: oZ <= C1;
        endcase
    end
endmodule

module mux_4_32(
    input [31:0] C0,
    input [31:0] C1,
    input [31:0] C2,
    input [31:0] C3,
    input [1:0] S0,
    output [31:0] oZ
    );

    reg [31:0] temp;

    always @(*) begin
        case(S0)
            2'b00: temp <= C0;
            2'b01: temp <= C1;
            2'b10: temp <= C2;
            2'b11: temp <= C3;
            default: temp <= 31'bz;
        endcase
    end

    assign oZ = temp;

endmodule

module mux_8_32(
    input [31:0] C0,
    input [31:0] C1,
    input [31:0] C2,
    input [31:0] C3,
    input [31:0] C4,
    input [31:0] C5,
    input [31:0] C6,
    input [31:0] C7,
    input [2:0] S0,

    output [31:0] oZ
    );

    reg [31:0] temp;

    always @(*) begin
        case(S0)
            3'b000: temp <= C0;
            3'b001: temp <= C1;
            3'b010: temp <= C2;
            3'b011: temp <= C3;
            3'b100: temp <= C4;
            3'b101: temp <= C5;
            3'b110: temp <= C6;
            3'b111: temp <= C7;
            default: temp <= 32'bz;
        endcase
    end
    
    assign oZ = temp;

endmodule