`timescale 1ns/1ps

module processing_element_tb;

parameter WIDTH = 8;

reg clk;
reg rst;
reg en;

reg [WIDTH-1:0] activation_in;
reg [WIDTH-1:0] weight_in;

wire [WIDTH-1:0] activation_out;
wire [WIDTH-1:0] weight_out;

wire [(2*WIDTH)-1:0] partial_sum;

processing_element #(
    .WIDTH(WIDTH)
)
dut
(
    .clk(clk),
    .rst(rst),
    .en(en),

    .activation_in(activation_in),
    .weight_in(weight_in),

    .activation_out(activation_out),
    .weight_out(weight_out),

    .partial_sum(partial_sum)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("verification/waveform/pe.vcd");
    $dumpvars(0, processing_element_tb);

end

initial begin

    clk = 0;

    rst = 1;

    en = 0;

    activation_in = 0;

    weight_in = 0;

    #10;

    rst = 0;

    en = 1;

    activation_in = 2;
    weight_in = 3;

    #10;

    activation_in = 5;
    weight_in = 4;

    #10;

    activation_in = 1;
    weight_in = 8;

    #10;

    $finish;

end

endmodule