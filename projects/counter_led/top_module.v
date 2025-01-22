`timescale 1ns / 1ps
module top_module (
    input clk,       // 100 MHz clock from Basys3
    input rst,       // Reset button
    output [3:0] LED, // Output counter value to LED
    output slow_clk
);
    //wire slow_clk; // Slow clock signal
    
    // Instantiate clock divider
    clock_divider clk_div (
        .clk(clk),
        .rst(rst),
        .slow_clk(slow_clk)
    );
    
    // Instantiate counter
    counter my_counter (
        .slow_clk(slow_clk),
        .rst(rst),
        .count(LED) // Connect counter output to LEDs
    );
endmodule

