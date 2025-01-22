`timescale 1ns / 1ps
module seven_seg_decoder(
    input wire [3:0] bin,    // 4-bit binary input
    output reg [6:0] seg     // 7-segment display output
);
    always @(*) begin
        case (bin)
            4'h0: seg = 7'b0000001; // 0
            4'h1: seg = 7'b1001111; // 1
            4'h2: seg = 7'b0010010; // 2
            4'h3: seg = 7'b0000110; // 3
            4'h4: seg = 7'b1001100; // 4
            4'h5: seg = 7'b0100100; // 5
            4'h6: seg = 7'b0100000; // 6
            4'h7: seg = 7'b0001111; // 7
            4'h8: seg = 7'b0000000; // 8
            4'h9: seg = 7'b0001100; // 9
            4'hA: seg = 7'b0001000; // A
            4'hB: seg = 7'b1100000; // B
            4'hC: seg = 7'b0110001; // C
            4'hD: seg = 7'b1000010; // D
            4'hE: seg = 7'b0110000; // E
            4'hF: seg = 7'b0111000; // F
            default: seg = 7'b1111111; // Blank display
        endcase
    end
endmodule
