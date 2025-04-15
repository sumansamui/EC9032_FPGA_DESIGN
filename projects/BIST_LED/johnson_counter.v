`timescale 1ns/1ps
module johnson_counter (
    input clk,
    input rst,
    output reg [15:0] C2
);
    always @(posedge(clk) or posedge(rst)) begin
        if(rst) begin
            C2 <= 16'd0;
        end
        else begin
            C2 <= {~C2[0],C2[15:1]};
        end
    end
endmodule