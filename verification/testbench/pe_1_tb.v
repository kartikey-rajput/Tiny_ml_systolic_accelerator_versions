`timescale 1ns/1ps

module processing_element_tb;

parameter WIDTH = 8;

reg clk;
reg rst;
reg en;

reg valid_in;

reg [WIDTH-1:0] activation_in;
reg [WIDTH-1:0] weight_in;

wire valid_out;

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

    .valid_in(valid_in),

    .activation_in(activation_in),
    .weight_in(weight_in),

    .activation_out(activation_out),
    .weight_out(weight_out),

    .valid_out(valid_out),

    .partial_sum(partial_sum)
);


//---------------------------------------------------------
// Clock Generation
//---------------------------------------------------------

always #5 clk = ~clk;


//---------------------------------------------------------
// Test Sequence
//---------------------------------------------------------

initial
begin

    clk = 0;
    rst = 1;
    en = 0;

    valid_in = 0;

    activation_in = 0;
    weight_in = 0;

    $dumpfile("./verification/waveform/pe_1.vcd");
    $dumpvars(0);

    #20;

    //-----------------------------------------------------
    // Release Reset
    //-----------------------------------------------------

    rst = 0;
    en = 1;

    //-----------------------------------------------------
    // Test Vector 1
    //-----------------------------------------------------

    valid_in = 1;

    activation_in = 8'd2;
    weight_in     = 8'd3;

    #10;

    //-----------------------------------------------------
    // Test Vector 2
    //-----------------------------------------------------

    activation_in = 8'd4;
    weight_in     = 8'd5;

    #10;

    //-----------------------------------------------------
    // Test Vector 3
    //-----------------------------------------------------

    activation_in = 8'd6;
    weight_in     = 8'd7;

    #10;

    //-----------------------------------------------------
    // Disable PE
    //-----------------------------------------------------

    en = 0;

    activation_in = 8'd15;
    weight_in     = 8'd15;

    #20;

    //-----------------------------------------------------
    // Enable Again
    //-----------------------------------------------------

    en = 1;

    activation_in = 8'd8;
    weight_in     = 8'd9;

    #10;

    //-----------------------------------------------------
    // Invalid Data
    //-----------------------------------------------------

    valid_in = 0;

    activation_in = 8'd10;
    weight_in     = 8'd10;

    #20;

    $finish;

end


//---------------------------------------------------------
// Monitor
//---------------------------------------------------------

initial
begin

$monitor(
"Time=%0t | rst=%b en=%b valid_in=%b valid_out=%b | Ain=%d Win=%d | Aout=%d Wout=%d | Sum=%d",
$time,
rst,
en,
valid_in,
valid_out,
activation_in,
weight_in,
activation_out,
weight_out,
partial_sum
);

end

endmodule