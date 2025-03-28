`timescale 1ns/1ps
module top_module(clk,rst,go,data_in,out,done,ps,rw,ld_acc,tacc,addr);
input clk,rst,go;
input [7:0] data_in;
output [7:0] out;
output done,rw;
wire ld_m,ld_out; // output from controller to datapath
wire add_inc,cmp;
output [3:0] addr;
output [2:0] ps;
output ld_acc;
output [7:0] tacc;
// instantiate datapath and controller

controller c1(clk,rst,go,cmp,ld_m,ld_acc,ld_out,addr_inc,done,rw,ps);
datapath d1(clk,rst,data_in,ld_m,ld_acc,ld_out,rw,addr_inc,cmp,out,tacc,addr);

endmodule 