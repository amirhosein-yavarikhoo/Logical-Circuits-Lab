`timescale 1ns/1ns
module wave_TB();
reg clk,rst_count;
wire [7:0] count_out,square,reciprocal,sin,fullrect,halfrect,triangle;
counter CNT (clk,rst_count,count_out);
wave_gen UUT (count_out,clk,square,reciprocal,triangle,sin,fullrect,halfrect);
initial begin
clk=1'b0;
repeat (4000) #1 clk=~clk;
end
initial begin
rst_count=1'b0;
#10 rst_count=1'b1;
#20 rst_count=1'b0;
#6000;
$stop;
end
endmodule