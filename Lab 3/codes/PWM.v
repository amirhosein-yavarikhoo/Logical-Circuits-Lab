module PWM( input clk,rst,input [7:0] data, output reg out);
	reg [7:0] count_out;
	counter cnt (clk,rst,count_out);
	always@(posedge clk) begin
	if (count_out>data) out=1'b0;
	else out=1'b1;
	end
endmodule
