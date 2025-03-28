`timescale 1ns / 1ps

module controller(clk,rst,go,cmp,ld_m,ld_acc,ld_out,addr_inc,done,rw,ps);
input clk,rst,go,cmp;
output reg ld_m,ld_acc,ld_out,done,addr_inc,rw;

output reg [2:0] ps;
reg [2:0] ns;
parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;
parameter s5=3'b101;
//parameter s6=3'b110;
//parameter s7=3'b111;


// modelling the state register

always @(posedge clk or posedge rst)
begin
if (rst==1'b1)
ps<=s0;
else
ps<=ns;
end

//Next state logic (combinational)

always @(go or cmp or ps)
begin
case(ps)
s0: begin
if (go==1'b0)
ns=s0;
else
ns=s1;
end
s1:ns=s2;
s2:ns=s3;
s3:ns=s4;
s4:begin
if(cmp==1'b1)
ns=s5;
else
ns=s1;
end
s4:ns=s0;
default:ns=s0;
endcase
end

// output logic (combinational)
always @(ps)
begin
case(ps)
s0:begin
ld_m=1'b0;
ld_acc=1'b0;
ld_out=1'b0;
done=1'b0;
addr_inc=1'b0;
rw=1'bx;
end
s1:begin
ld_m=1'b0;
ld_acc=1'b0;
ld_out=1'b0;
done=1'b0;
addr_inc=1'b1;
rw=1'b1;
end
s2:begin
ld_m=1'b1;
ld_acc=1'b0;
ld_out=1'b0;
done=1'b0;
addr_inc=1'b0;
rw=1'bx;
end
s3:begin
ld_m=1'b0;
ld_acc=1'b1;
ld_out=1'b0;
done=1'b0;
addr_inc=1'b0;
rw=1'bx;
end
s4:begin
ld_m=1'b0;
ld_acc=1'b0;
ld_out=1'b0;
done=1'b0;
addr_inc=1'b0;
rw=1'bx;
end
s5:begin
ld_m=1'b0;
ld_acc=1'b0;
ld_out=1'b1;
done=1'b1;
addr_inc=1'b0;
rw=1'bx;
end
default:begin
ld_m=1'b0;
ld_acc=1'b0;
ld_out=1'b0;
done=1'b0;
addr_inc=1'b0;
rw=1'bx;
end
endcase
end
endmodule
