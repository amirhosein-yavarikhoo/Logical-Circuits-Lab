module counter(input clk,rst, output reg [7:0] count_out);
always @(posedge clk) begin
	if (rst==1'b1) count_out=8'd0;
	else count_out=count_out+1;
end
endmodule
