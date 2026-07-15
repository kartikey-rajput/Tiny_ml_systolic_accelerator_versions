`timescale 1ns/1ps
module register #(parameter width = 8)(
    input wire clk ,
    input wire rst,
    input wire en,
    input wire [width-1:0] d,
    output reg  [width-1:0] q
);
always @(posedge clk) begin
    if (rst)
        q<= '0;
    else if (en)
        q<= d;
    
end
initial begin
    $dumpfile("verification/waveform/register.vcd");
    $dumpvars(0, register_tb);
end
endmodule 