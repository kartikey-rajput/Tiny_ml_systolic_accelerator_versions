`timescale 1ns/1ps

module accumulator_tb;

parameter WIDTH = 8;

reg clk;
reg rst;
reg en;

reg [(2*WIDTH)-1:0] data_in;

wire [(2*WIDTH)-1:0] sum;

accumulator #(
    .WIDTH(WIDTH)
) dut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .data_in(data_in),
    .sum(sum)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("verification/waveform/accumulator.vcd");
    $dumpvars(0, accumulator_tb);
end

initial begin

    clk = 0;
    rst = 1;
    en  = 0;
    data_in = 0;

    #10;

    rst = 0;
    en = 1;

    data_in = 10;
    #10;

    data_in = 20;
    #10;

    data_in = 30;
    #10;

    data_in = 40;
    #10;

    en = 0;
    data_in = 100;
    #10;

    rst = 1;
    #10;

    $finish;

end

endmodule