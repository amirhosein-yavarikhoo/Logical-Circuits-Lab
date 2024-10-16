`timescale 1ns/1ns
module DDSTB();
reg clk;
reg [1:0] phase_cntrl;
wire [7:0] DDS_out;
DDS UUT(clk,phase_cntrl,DDS_out);
initial begin
clk=1'b0;
repeat (20000) #2 clk=~clk;
end
initial begin
#10 phase_cntrl=1'b1;
end
endmodule
