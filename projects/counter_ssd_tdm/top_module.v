`timescale 1ns / 1ps
module top_module(
    input wire clk,          // 100 MHz clock
    input wire rst,          // Reset button
    output [6:0] seg,        // 7-segment display output
    output [3:0] an        // Enable signals for multiplexing   
);
    wire clk_slow;
    wire [9:0] count;
    wire [3:0] thousands,hundreds,tens, ones;

    // Generate 1Hz clock for counting
    clk_divider clk_div1 (
        .clk(clk),
        .rst(rst),
        .slow_clk(clk_slow)
    );

    // 10-bit Counter
    counter counter_8bit (
        .slow_clk(clk_slow),
        .rst(rst),
        .count(count)
    );

    // Convert Binary to BCD
    bin_to_bcd converter1 (
        .bin(count),
        .thousands(thousands),
        .hundreds(hundreds),
        .tens(tens),
        .ones(ones)
    );

    // Multiplexing Display for 3 Digits
    seven_seg_mux display_mux (
        .clk(clk),  // Fast clock for switching
        .rst(rst),
        .thousands(thousands),
        .hundreds(hundreds),
        .tens(tens),
        .ones(ones),
        .seg(seg),
        .an(an)
    );

endmodule
