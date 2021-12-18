module test_cpu(
    );
    reg clk, rst;
    wire [31:0] pc;
    wire [31:0] instruction;
    wire [31:0] final;
    wire [7:0] o_seg;
    wire [7:0] o_sel;
    wire [31:0] show;
    reg [5:0] pos;
    reg stop;
    
    pipe_top pipe(
    .clk(clk),
    .rst(rst),
    .stop(stop),
    .pc(pc),
    .pos(pos),
    .instruction(instruction),
    .o_seg(o_seg),
    .o_sel(o_sel),
    .final(final),
    .show(show)
    );
    initial begin
    clk<=0;
    forever #4 clk<=~clk;
    end

    initial begin
        rst <= 1'b1;
        #20 rst=1'b0;
    end

    initial begin
        stop <= 1'b0;
        pos <= 6'b0;
        #500000 stop <= 1'b1;
        #700000 stop <= 1'b0;
        #700100 pos <= 6'h3b;
    end



    
endmodule