`timescale 1ns/1ps

module accumulator #(
    parameter WIDTH = 8
)(
    input wire clk,
    input wire rst,
    input wire en,
    input wire valid_in,

    input wire [(2*WIDTH)-1:0] data_in,

    output reg [(2*WIDTH)-1:0] sum
);

always @(posedge clk) begin

    if (rst)
        sum <= '0;

    else if (en && valid_in)
        sum <= sum + data_in;

end

endmodule