module WaveGenComp(input clk,count_rst,input [1:0] phase_cntrl, input [2:0] sw97, output [7:0] out);
wire [7:0] count_out,square,recip,triangle,sinout,fullrect,halfrect,dds_out,dummy;
counter cnt (clk,count_rst,count_out);
wave_gen wv (count_out,clk,square,recip,triangle,sinout,fullrect,halfrect);
DDS dds (clk,phase_cntrl,dds_out);
mux mux8 (recip,square,triangle,sinout,fullrect,halfrect,dds_out,dummy,sw97,out);
endmodule