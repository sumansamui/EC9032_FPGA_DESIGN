`timescale 1ns / 1ps
module addr_generator (
    input clk,            // Clock signal
    input reset,          // Synchronous reset signal
    input addr_inc,         // Enable signal
    output reg [3:0] addr // 4-bit counter output
);
    // Always block triggered on the rising edge of the clock
    always @(posedge clk, posedge reset) begin
        if (reset)
            addr <= 4'b0000;  // Reset the counter to 0
        else if (addr_inc)
            addr <= addr + 1; // Increment the counter when enabled
    end
endmodule
