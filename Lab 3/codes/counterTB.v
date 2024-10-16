`timescale 1ns/1ns
module counterTB();
reg clk,rst;
wire [7:0] count_out;
counter UUT(clk,rst,count_out);
initial begin
clk=1'b0;
repeat (800) #2 clk=~clk;
end
initial begin
rst=1'b0;
#10 rst=1'b1;
#20 rst=1'b0;
#2000;
$stop;
end
endmodule
