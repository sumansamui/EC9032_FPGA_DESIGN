`timescale 1ns / 1ps
module adder (
    input [7:0] a,         // 12-bit input A
    input [7:0] b,         // 12-bit input B
    output [7:0] sum       // 12-bit sum output
);
    // Perform addition  producing a 12-bit sum
    assign sum = a + b;

endmodule