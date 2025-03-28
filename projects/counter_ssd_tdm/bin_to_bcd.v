`timescale 1ns / 1ps
module bin_to_bcd (
    input wire [9:0] bin, // 10-bit binary input
    output reg [3:0] ones, // Ones place
    output reg [3:0] tens,  // Tens place
    output reg [3:0] hundreds,
    output reg [3:0] thousands 
);
    always @(bin) begin
        ones = bin % 10;
        tens = (bin / 10) % 10;
        hundreds = (bin / 100) % 10;
        thousands = (bin / 1000) % 10;
    end
endmodule
