`timescale 1ns / 1ps
module adder_4bit (input [3:0] A, B,  // 4-bit inputs
    output [3:0] sum,  // 4-bit sum output
    output carry       // Carry output
);
assign {carry, sum} = A + B;
endmodule

