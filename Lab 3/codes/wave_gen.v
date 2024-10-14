module wave_gen (input [7:0] count_in, input clk, output reg [7:0] square,reciprocal,triangle, output [7:0] sin_out,output reg [7:0] fullrect,halfrect);
reg [15:0] sin_old =16'd0;
reg [15:0]cos_old=16'd30000;
reg [15:0] sin_new,cos_new;
always @(posedge clk) begin
	if(count_in == 8'd0) triangle = 8'd0;
	if (count_in<8'd127) begin
 	square=8'd255;
 	triangle = triangle + 1'b1;
  	end
  	if (count_in>8'd127) begin 
 	square=8'd0;
 	triangle = triangle - 1'b1;
  	end
	reciprocal=(255/(256-count_in));
end
always@(sin_old,cos_old) begin
	sin_new=sin_old+{{6{cos_old[15]}},cos_old[15:6]};
	cos_new=cos_old-{{6{sin_new[15]}},sin_new[15:6]};
end
always @(posedge clk) begin
	sin_old=sin_new;
	cos_old=cos_new;
end
always @(sin_new) begin
if (sin_out<8'd127) 
	fullrect=sin_out+2*(8'd127-sin_out);
else 
fullrect=sin_out;

end
always @(sin_new) begin
if (sin_out<8'd127) 
	halfrect=8'd127;
else 
halfrect=sin_out;

end
assign	sin_out=sin_new[15:8]+8'd127;
endmodule
