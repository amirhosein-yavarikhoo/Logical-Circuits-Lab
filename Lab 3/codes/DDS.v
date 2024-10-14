/*module DDS(input clk,input [1:0] phase_cntrl, output reg [7:0] DDS_out);
(*romstyle="M9K" *) (* ram_init_file = "data.mif"*) reg [7:0] rom [3:0];
wire count_rst;
wire [7:0] address;
counter cnt (clk,rst_count,address);
ROMq rom (address,clk,DDS_out);
endmodule*/