`timescale 1ns/1ns
module wrapperTB();
reg clk,start,rst;
reg [1:0] ui;
reg [4:0] vi;
wire wr_req,done;
wire [20:0] data_out;
wrapper UUT (clk,start,rst,ui,vi,wr_req,data_out,done);
initial begin
clk=1'b0;
repeat (600)#5 clk=~clk;
end
initial begin
start=1'b0;
rst=1'b1;
ui=2'd3;
vi=5'd6;
#10 rst=1'b0;
#5 start=1'b1;
#10 start=1'b0;
#1000;
#1000;
end
endmodule
