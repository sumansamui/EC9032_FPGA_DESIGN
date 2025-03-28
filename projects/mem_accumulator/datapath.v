`timescale 1ns/1ps
module datapath(clk,rst,data_in,ld_m,ld_acc,ld_out,rw,addr_inc,cmp,out,tacc,addr);
input clk,rst,ld_m,ld_acc,ld_out,rw,addr_inc;
output cmp;
output [7:0] out;
output [7:0] tacc;
wire [7:0] tmout;
wire [7:0] tadd,tmin;
output [3:0] addr;
input [7:0] data_in;

adder a1(tmout,tacc,tadd);
addr_generator ag1(clk,rst,addr_inc,addr);
comparator comp1(addr,cmp);  
register_8bit rm(clk,rst,tmin,ld_m,tmout);
register_8bit racc(clk,rst,tadd,ld_acc,tacc);
register_8bit rout(clk,rst,tacc,ld_out,out);
memory mem1(clk,rw,addr,data_in,tmin);
endmodule
