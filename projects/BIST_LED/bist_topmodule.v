`timescale 1ns/1ps

module bist_topmodule (
    input clk,
    input rst,
    input [1:0] mode,
    output [15:0] led
);

wire ring_counter_enable;
wire johnson_counter_enable;
wire lfsr_enable;
wire slow_clk;

bist_controlpath inst1(
    .clk(slow_clk), 
    .rst(rst), 
    .mode(mode), 
    .ring_counter_enable(ring_counter_enable),
    .johnson_counter_enable(johnson_counter_enable),
    .lfsr_enable(lfsr_enable)
    );

bist_datapath inst2(
    .clk(slow_clk),
    .rst(rst),
    .mode(mode),
    .ring_counter_enable(ring_counter_enable),
    .johnson_counter_enable(johnson_counter_enable),
    .lfsr_enable(lfsr_enable),
    .led(led)
);

clock_divider inst3(
    .clk(clk),
    .rst(rst),
    .slow_clk(slow_clk)
);
    
    
endmodule