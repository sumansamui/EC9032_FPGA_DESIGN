`timescale 1ns / 1ps
module counter_10bit (
    input slow_clk,  // Slow clock input
    input rst,       // Reset
    output reg [9:0] count // 10-bit count output
);
    always @(posedge slow_clk or posedge rst) begin
        if (rst)
            count <= 0;
        else if (count==8'd9)
            count<=0;
        else
            count <= count + 1;
    end
endmodule

