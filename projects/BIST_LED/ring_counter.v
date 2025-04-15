`timescale 1ns/1ps
module ring_counter (
    input clk,
    input rst,
    output reg [15:0] C1
);
    always @(posedge(clk) or posedge(rst)) begin
        if(rst) begin
            C1 <= 16'd1;
        end
        else begin
            C1 <= {C1[0],C1[15:1]};
        end
    end
endmodule