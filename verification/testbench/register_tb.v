`timescale 1ns/1ps

module register_tb;

parameter width = 8;

reg clk;
reg rst;
reg en;
reg [width-1:0] d;

wire [width-1:0] q;

register #(
    .width(width)
) dut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(d),
    .q(q)
);
always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    en  = 0;
    d   = 0;

    #10;

    rst = 0;

    en = 1;
    d = 8'hAA;

    #10;

    d = 8'h55;

    #10;

    en = 0;
    d = 8'hFF;

    #10;

    rst = 1;

    #10;

    $finish;

end

endmodule