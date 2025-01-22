`timescale 1ns / 1ps
module counter (
    input slow_clk,  // Slow clock input
    input rst,       // Reset
    output reg [3:0] count // 4-bit count output
);
    always @(posedge slow_clk or posedge rst) begin
        if (rst)
            count <= 0;
        else
            count <= count + 1;
    end
endmodule

