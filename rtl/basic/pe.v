`timescale 1ns/1ps

module processing_element #(
    parameter WIDTH = 8
)(
    input wire clk,
    input wire rst,
    input wire en,

    input wire [WIDTH-1:0] activation_in,
    input wire [WIDTH-1:0] weight_in,

    output reg [WIDTH-1:0] activation_out,
    output reg [WIDTH-1:0] weight_out,

    output wire [(2*WIDTH)-1:0] partial_sum
);

mac #(
    .WIDTH(WIDTH)
)
u_mac
(
    .clk(clk),
    .rst(rst),
    .en(en),

    .a(activation_in),
    .b(weight_in),

    .sum(partial_sum)
);

always @(posedge clk) begin

    if(rst) begin

        activation_out <= '0;
        weight_out <= '0;

    end

    else if(en) begin

        activation_out <= activation_in;
        weight_out <= weight_in;

    end

end

endmodule