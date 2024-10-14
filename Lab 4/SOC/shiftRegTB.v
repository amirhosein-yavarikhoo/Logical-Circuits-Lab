`timescale 1ns/1ns
module shiftRegTB();
reg clk, rst, sh_en, ld;
reg[15:0] vi;
wire [15:0] out;
shiftReg UUT(clk, rst, sh_en, ld, vi, out);
initial begin
clk=1'b0;
repeat (1000) #2 clk=~clk;
end
initial begin
#40 rst = 1'd0;
#40 rst = 1'd1;
#40 rst = 1'd0;
#40 vi = 16'd33;
#40 ld = 1'b1;
#40 ld = 1'b0;
#40 sh_en = 1'b1;
#30 sh_en = 1'b0;
end
endmodule
