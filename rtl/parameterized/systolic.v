`timescale 1ns/1ps

module systolic_array_2x2 #(
    parameter WIDTH = 8
)(
    input clk,
    input rst,
    input en,

    input valid_in,

    // Left side activations
    input [WIDTH-1:0] activation_in0,
    input [WIDTH-1:0] activation_in1,

    // Top side weights
    input [WIDTH-1:0] weight_in0,
    input [WIDTH-1:0] weight_in1,

    // Partial sums from each PE
    output [(2*WIDTH)-1:0] partial_sum00,
    output [(2*WIDTH)-1:0] partial_sum01,
    output [(2*WIDTH)-1:0] partial_sum10,
    output [(2*WIDTH)-1:0] partial_sum11,

    output valid_out
);

/////////////////////////////////////////////////////////////
// Internal activation wires
/////////////////////////////////////////////////////////////

wire [WIDTH-1:0] act_00_to_01;
wire [WIDTH-1:0] act_10_to_11;

/////////////////////////////////////////////////////////////
// Internal weight wires
/////////////////////////////////////////////////////////////

wire [WIDTH-1:0] wt_00_to_10;
wire [WIDTH-1:0] wt_01_to_11;

/////////////////////////////////////////////////////////////
// Internal valid wires
/////////////////////////////////////////////////////////////

wire valid00;
wire valid01;
wire valid10;
wire valid11;

/////////////////////////////////////////////////////////////
// PE00
/////////////////////////////////////////////////////////////

processing_element #(
    .WIDTH(WIDTH)
)
PE00
(
    .clk(clk),
    .rst(rst),
    .en(en),

    .valid_in(valid_in),

    .activation_in(activation_in0),
    .weight_in(weight_in0),

    .activation_out(act_00_to_01),
    .weight_out(wt_00_to_10),

    .valid_out(valid00),

    .partial_sum(partial_sum00)
);

/////////////////////////////////////////////////////////////
// PE01
/////////////////////////////////////////////////////////////

processing_element #(
    .WIDTH(WIDTH)
)
PE01
(
    .clk(clk),
    .rst(rst),
    .en(en),

    .valid_in(valid00),

    .activation_in(act_00_to_01),
    .weight_in(weight_in1),

    .activation_out(),
    .weight_out(wt_01_to_11),

    .valid_out(valid01),

    .partial_sum(partial_sum01)
);

/////////////////////////////////////////////////////////////
// PE10
/////////////////////////////////////////////////////////////

processing_element #(
    .WIDTH(WIDTH)
)
PE10
(
    .clk(clk),
    .rst(rst),
    .en(en),

    .valid_in(valid00),

    .activation_in(activation_in1),
    .weight_in(wt_00_to_10),

    .activation_out(act_10_to_11),
    .weight_out(),

    .valid_out(valid10),

    .partial_sum(partial_sum10)
);

/////////////////////////////////////////////////////////////
// PE11
/////////////////////////////////////////////////////////////

processing_element #(
    .WIDTH(WIDTH)
)
PE11
(
    .clk(clk),
    .rst(rst),
    .en(en),

    .valid_in(valid10),

    .activation_in(act_10_to_11),
    .weight_in(wt_01_to_11),

    .activation_out(),
    .weight_out(),

    .valid_out(valid11),

    .partial_sum(partial_sum11)
);

assign valid_out = valid11;

endmodule