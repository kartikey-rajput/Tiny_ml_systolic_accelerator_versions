`timescale 1ns/1ps

module multiplier_tb;

parameter WIDTH = 8;

// Inputs
reg [WIDTH-1:0] a;
reg [WIDTH-1:0] b;

// Output
wire [(2*WIDTH)-1:0] product;

// Instantiate DUT
multiplier #(
    .WIDTH(WIDTH)
) dut (
    .a(a),
    .b(b),
    .product(product)
);




initial begin

  
    a = 0;
    b = 0;
    #10;

    a = 5;
    b = 3;
    #10;


    a = 10;
    b = 20;
    #10;


    a = 255;
    b = 255;
    #10;

    a = 15;
    b = 12;
    #10;

    $finish;

end;
initial begin
    $dumpfile("verification/waveform/multiplier.vcd");
    $dumpvars(0, multiplier_tb);

    $monitor("t=%0t  a=%0d  b=%0d  product=%0d",
             $time, a, b, product);
end


endmodule