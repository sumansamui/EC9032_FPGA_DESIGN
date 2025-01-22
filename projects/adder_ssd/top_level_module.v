`timescale 1ns / 1ps
module top_level_module(
    input [7:0] sw,        // Inputs for addition
    output [3:0] an,         // Anode control
    output [6:0] seg,         // 7-segment output
    output ovf
);
    wire [3:0] sum;
    wire carry;
    
    // Instantiate the adder
    adder_4bit add_inst(.A(sw[3:0]), .B(sw[7:4]), .sum(sum), .carry(carry));

    // Instantiate the 7-segment decoder
    seven_seg_decoder seg_inst(.bin(sum), .seg(seg));

    assign an = 4'b1110; // Enable first digit
    
    assign ovf = carry;
endmodule
