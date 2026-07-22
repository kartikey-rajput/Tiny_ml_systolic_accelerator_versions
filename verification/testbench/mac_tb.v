`timescale 1ns/1ps

module mac_tb;

parameter WIDTH = 8;

reg clk;
reg rst;
reg en;

reg [WIDTH-1:0] a;
reg [WIDTH-1:0] b;

wire [(2*WIDTH)-1:0] sum;

mac #(
    .WIDTH(WIDTH)
)
dut
(
    .clk(clk),
    .rst(rst),
    .en(en),

    .a(a),
    .b(b),

    .sum(sum)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("verification/waveform/mac.vcd");
    $dumpvars(0, mac_tb);
end

initial begin

    clk = 0;
    rst = 1;
    en = 0;

    a = 0;
    b = 0;

    #10;

    rst = 0;
    en = 1;

    a = 2;
    b = 3;

    #10;

    a = 5;
    b = 4;

    #10;

    a = 1;
    b = 8;

    #10;

    en = 0;

    #10;

    rst = 1;

    #10;

    $finish;

end
 
endmodule