
`timescale 1ns/1ps
module bist_datapath (
    input clk,
    input rst,
    input [1:0] mode,
    input ring_counter_enable,
    input johnson_counter_enable,
    input lfsr_enable,
    output reg [15:0] led
);

reg clk2;
reg clk3;
reg clk4;
wire [15:0] C2,C3,C4;

ring_counter instantiation(.clk(clk2), .rst(rst), .C1(C2));
johnson_counter instantiation2(.clk(clk3), .rst(rst), .C2(C3));
lfsr instantiation3(.clk(clk4), .rst(rst), .C3(C4));

//Output based on the mode or multiplexer operation
always @(rst or C2 or C3 or C4 or mode) begin
    if(rst) begin
        led = 16'b0;
    end
    else begin
        if(mode == 2'b01) begin
            led = C2;
        end
        else if(mode == 2'b10) begin
            led = C3;
        end
        else if(mode == 2'b11) begin
            led = C4;
        end
        else if(mode == 2'b00) begin
            led = 16'd0;
        end
        else begin
            led = 16'd0;
        end
    end
end

//Clock_Enable for each counter
//The clock for each counter is enabled based on the enable signal
//If the enable signal is high, the clock is passed to the counter, else it is not passed
/*
This can be enabled using three ways:
1.
assign clk2 = clk & ring_counter_enable;
assign clk3 = clk & johnson_counter_enable;
assign clk4 = clk & lfsr_enable;

2. Design a end gate and feed the clk and enable signal to it and instantiate it in the respective counter
3. Use a always block to assign the clk to the counter based on the enable signal as shown in the below code.
    At every change in clk, the clk is assigned to the counter based on the enable signal.
    This is the most efficient way to do it as it does not require any extra gates and is easy to understand.
*/
always @(clk) begin
    if(ring_counter_enable) begin
        clk2 <= clk;
    end
    else if(johnson_counter_enable) begin
        clk3 <= clk;
    end
    else if (lfsr_enable) begin
        clk4 <= clk;
    end
end
    
endmodule