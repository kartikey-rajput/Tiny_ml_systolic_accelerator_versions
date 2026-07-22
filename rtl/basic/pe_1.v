`timescale 1ns/1ps

module processing_element #(
    parameter WIDTH = 8
)(
    input  wire                     clk,
    input  wire                     rst,
    input  wire                     en,

    // Data valid signal
    input  wire                     valid_in,

    // Inputs
    input  wire [WIDTH-1:0]         activation_in,
    input  wire [WIDTH-1:0]         weight_in,

    // Forwarded outputs
    output reg  [WIDTH-1:0]         activation_out,
    output reg  [WIDTH-1:0]         weight_out,

    // Valid propagation
    output reg                      valid_out,

    // MAC result
    output wire [(2*WIDTH)-1:0]     partial_sum
);

    //----------------------------------------------------------
    // Internal Pipeline Registers
    //----------------------------------------------------------

    reg [WIDTH-1:0] activation_reg;
    reg [WIDTH-1:0] weight_reg;

    //----------------------------------------------------------
    // Input Pipeline Stage
    //----------------------------------------------------------

    always @(posedge clk) begin

        if (rst) begin

            activation_reg <= '0;
            weight_reg     <= '0;

            activation_out <= '0;
            weight_out     <= '0;

            valid_out      <= 1'b0;

        end

        else if (en ) begin

            // Register incoming data
            activation_reg <= activation_in;
            weight_reg     <= weight_in;

            // Forward data to neighbouring PE
            activation_out <= activation_in;
            weight_out     <= weight_in;

            // Propagate valid signal
            valid_out      <= valid_in;

        end

    end

    //----------------------------------------------------------
    // Multiply-Accumulate Unit
    //----------------------------------------------------------

    mac #(
        .WIDTH(WIDTH)
    )
    u_mac
    (
        .clk(clk),
        .rst(rst),
        .en(en),

        .a(activation_reg),
        .b(weight_reg),

        .sum(partial_sum),
        .valid_in(valid_in)
    );

endmodule