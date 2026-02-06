`timescale 1ns / 1ps
module tdm_digit_select (
    input wire clk,        // 100 MHz clock
    input wire rst,
    input wire [3:0] d0, // Ones place BCD digit
    input wire [3:0] d1, // Tens place BCD digit
    input wire [3:0] d2,
    input wire [3:0] d3,
    output reg [3:0] digit,  // Seven-segment display output
    output reg [3:0] an    // Anode control for display selection
);
    reg [1:0] digit_select; // Refresh counter
    
    //reg [3:0] digit; // Current digit being displayed
    
    reg [16:0] digit_timer;     // counter for digit refresh 
    
     always @(posedge clk or posedge rst) begin
        if(rst) begin
            digit_timer <= 0; 
        end
        else                                        // 1ms x 4 displays = 4ms refresh period
            if(digit_timer == 49_999) begin         // The period of 100MHz clock is 10ns (1/100,000,000 seconds)
                digit_timer <= 0;                   // 10ns x 100,000 = 1ms
                
            end
            else
                digit_timer <=  digit_timer + 1;
    end                
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            digit_select <= 0;
        end
        else if(digit_timer == 49_999) begin        
             digit_select <=  digit_select + 1;
            
            end
        end
    
    always @(digit_select) begin
        case (digit_select) // Rotate through displays
            2'b00: begin
                an <= 4'b1110; // Enable ones place
                digit <= d0;
            end
            2'b01: begin
                an <= 4'b1101; // Enable tens place
                digit <= d1;
            end
            2'b10: begin
                an <= 4'b1011; // Enable hundreds place
                digit <= d2;
            end
            2'b11: begin
                an <= 4'b0111; // Enable hundreds place
                digit <= d3;
            end
            default: begin
                an <= 4'b1111; // Turn off all displays
            end
        endcase
    end

endmodule

