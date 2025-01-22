module Calculator (
    input [7:0] sw,         // 4-bit input A
    //input [3:0] B,         // 4-bit input B
    input mode,            // Control signal: 0 for addition, 1 for multiplication
    output reg [7:0] LED// 8-bit output to handle the larger result of multiplication
);

always @(*) begin
    case (mode)
        1'b0: LED = sw[3:0] + sw[7:4];          // Perform addition
        1'b1: LED = sw[3:0]*sw[7:4];          // Perform multiplication
        default: LED = 8'b0;        // Default to 0 (should not occur)
    endcase
end

endmodule
