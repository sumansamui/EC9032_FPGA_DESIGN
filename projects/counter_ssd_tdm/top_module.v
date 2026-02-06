`timescale 1ns / 1ps
module top_module(
    input wire clk,          // 100 MHz clock
    input wire rst,          // Reset button
    output [6:0] seg,        // 7-segment display output
    output [3:0] an        // Enable signals for multiplexing   
);
    wire clk_slow;
    wire [9:0] count;
    wire [3:0] d0,d1,d2, d3;
    
    wire [3:0] digit;

    // Generate 1Hz clock for counting
    clk_divider clk_div1 (
        .clk(clk),
        .rst(rst),
        .slow_clk(clk_slow)
    );

    // 10-bit Counter
    counter_10bit counter1 (
        .slow_clk(clk_slow),
        .rst(rst),
        .count(count)
    );

    // Convert Binary to BCD
    bin_to_digit_converter converter1 (
        .bin(count),
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3)
    );

    // Multiplexing Display for 3 Digits
    tdm_digit_select (
        .clk(clk),  // Fast clock for switching
        .rst(rst),
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .digit(digit),
        .an(an)
    );                          
    
    
    // Instantiate the seven-segment decoder
    seven_seg_decoder decoder (
        .bin(digit),
        .seg(seg)
    );

endmodule
