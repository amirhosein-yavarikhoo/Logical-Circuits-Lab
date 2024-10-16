`timescale 1ns/1ns
module freqTB22();
reg [4:0] SW;
reg clk,RO_clk,rst;
wire out_clk;
freq_sel UUT (rst,SW,clk,RO_clk,out_clk);
initial begin
clk=1'b0;
repeat (2000) #2 clk=~clk;
end
initial begin 
RO_clk=1'b1;
SW=5'd10;
rst=1'b1;
#10 rst=1'b0;
#1000;
SW=5'd20;
#2000;
end
endmodule
