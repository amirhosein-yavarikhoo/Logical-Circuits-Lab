`timescale 1ps/1ps
module WGCTB();
reg clk,rst;
reg [1:0] amp_sel;
reg [2:0]wave_sel;
wire [7:0] address_out,rom_out,wave_out,mux_out;
wire [8:0] count_out;
reg [4:0] freqinit;
LAB3final UUT(address_out,rst,clk,freqinit,count_out,mux_out,wave_sel,rom_out,wave_out,amp_sel);
initial begin
clk=1'b0;
repeat (4805000) #1 clk=~clk;
end
initial begin
freqinit=5'd20;
wave_sel=3'd0;
amp_sel=2'd0;
wave_sel=3'd5;
rst=1'b1;
#20 rst=1'b0;
#400000 wave_sel=3'd1;
#400000 wave_sel=3'd2;
amp_sel=2'd1;
freqinit=5'd1;
#400000 wave_sel=3'd3;
#400000 freqinit=5'd10;
#400000 wave_sel=3'd4;
#400000 amp_sel=2'd2;
#400000 wave_sel=3'd5;
#400000 wave_sel=3'd6;
amp_sel=2'd3;
#400000 wave_sel=3'd7;
#400000 wave_sel=3'd0;
#400000 freqinit=5'd0;
end
endmodule
