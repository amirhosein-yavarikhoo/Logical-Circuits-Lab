module freq_sel (input rst, input [4:0] SW, input clk, output reg out_clk,output reg [8:0] count);
wire [8:0] count_init;
assign count_init[3:0]=4'b0000;
assign count_init[8:4]=SW;
always @(posedge clk) begin
count=count_init;
if (rst==1'b1) count=9'd0;
count=count+1;
if (count==9'd511) out_clk=1'b1;
else out_clk=1'b0;
end
endmodule