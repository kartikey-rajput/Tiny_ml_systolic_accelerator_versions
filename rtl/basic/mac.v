`timescale 1ns/1ps

module mac #(
    parameter WIDTH = 8
)(
    input wire clk,
    input wire rst,
    input wire en,

    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,

    output wire [(2*WIDTH)-1:0] sum,
    input valid_in
);

wire [(2*WIDTH)-1:0] product;

multiplier #(
    .WIDTH(WIDTH)
)
u_multiplier
(
    .a(a),
    .b(b),
    .product(product)
);

accumulator #(
    .WIDTH(WIDTH)
)
u_accumulator
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .data_in(product),
    .sum(sum),
    .valid_in(valid_in)
);

endmodule