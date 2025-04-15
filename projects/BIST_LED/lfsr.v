`timescale 1ns/1ps
module lfsr (
    input clk,
    input rst,
    output reg [15:0] C3
);
    always @(posedge(clk) or posedge(rst)) begin
        if(rst) begin
            C3 <= 16'b1010101010101010;
        end
        else begin
            C3 <= {C3[15]^C3[14]^C3[1],C3[15:1]};
        end
    end
endmodule