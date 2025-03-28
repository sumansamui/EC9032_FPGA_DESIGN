`timescale 1ns / 1ps
module seven_seg_mux (
    input wire clk,        // 100 MHz clock
    input wire rst,
    input wire [3:0] ones, // Ones place BCD digit
    input wire [3:0] tens, // Tens place BCD digit
    input wire [3:0] hundreds,
    input wire [3:0] thousands,
    output wire [6:0] seg,  // Seven-segment display output
    output reg [3:0] an    // Anode control for display selection
);
    reg [1:0] digit_select; // Refresh counter
    reg [3:0] digit; // Current digit being displayed
    reg [16:0] digit_timer;     // counter for digit refresh 
    
     always @(posedge clk or posedge rst) begin
        if(rst) begin
            digit_select <= 0;
            digit_timer <= 0; 
        end
        else                                        // 1ms x 4 displays = 4ms refresh period
            if(digit_timer == 99_999) begin         // The period of 100MHz clock is 10ns (1/100,000,000 seconds)
                digit_timer <= 0;                   // 10ns x 100,000 = 1ms
                digit_select <=  digit_select + 1;
            end
            else
                digit_timer <=  digit_timer + 1;
    end
    
    always @(digit_select) begin
        case (digit_select) // Rotate through displays
            2'b00: begin
                an <= 4'b1110; // Enable ones place
                digit <= ones;
            end
            2'b01: begin
                an <= 4'b1101; // Enable tens place
                digit <= tens;
            end
            2'b10: begin
                an <= 4'b1011; // Enable hundreds place
                digit <= hundreds;
            end
            2'b11: begin
                an <= 4'b0111; // Enable hundreds place
                digit <= thousands;
            end
            default: begin
                an <= 4'b1111; // Turn off all displays
            end
        endcase
    end

    // Instantiate the seven-segment decoder
    seven_seg_decoder decoder (
        .bin(digit),
        .seg(seg)
    );
endmodule

