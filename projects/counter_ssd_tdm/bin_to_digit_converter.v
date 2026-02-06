`timescale 1ns / 1ps
module bin_to_digit_converter (
    input wire [9:0] bin, // 10-bit binary input
    output reg [3:0] d0, // Ones place
    output reg [3:0] d1,  // Tens place
    output reg [3:0] d2,
    output reg [3:0] d3 
);
    always @(bin) begin
        d0 = bin % 10;
        d1 = (bin / 10) % 10;
        d2 = (bin / 100) % 10;
        d3 = (bin / 1000) % 10;
    end
endmodule
