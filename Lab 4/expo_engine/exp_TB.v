`timescale 1ns/1ns
module expoTB();
wire done;
wire [1:0] int;
wire [15:0] frac;
reg clk,rst,start;
reg [15:0] x;
exponential UUT (clk,rst,start,x,done,int,frac);
initial begin
clk=1'b0;
repeat (600) #5 clk=~clk;
end
initial begin
rst=1'b1;
start=1'b0;
#10 rst=1'b0;
start=1'b1;
x=16'd15000;
#5 start=1'b0;
#800;
x=16'd35000;
start=1'b0;
#5 start=1'b1;
#5 start=1'b0;
#800;
x=16'd50000;
start=1'b0;
#5 start=1'b1;
#5 start=1'b0;
#800;
end
endmodule
