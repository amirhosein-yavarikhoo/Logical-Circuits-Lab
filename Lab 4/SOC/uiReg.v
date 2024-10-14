module Register(input clk, rst, ld, input[1:0] vi, output reg[1:0] out);

always@(posedge clk) begin
	if (rst) out = 2'd0;
	else if (ld) out = vi;	
end
endmodule
	
