`timescale 1ns / 1ps
module comparator (
    input [3:0] a,       // 4-bit input
    output reg result    // Output: 1 if a == 9, else 0
);
    always @(a) begin
        if (a == 4'b0101) // 4'b1001 is the binary representation of 9
            result = 1;
        else
            result = 0;
    end
endmodule

