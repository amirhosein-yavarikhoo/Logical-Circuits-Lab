module shiftReg(input clk, rst, sh_en, ld, input[15:0] vi, output [15:0] out);
reg [15:0] shift_reg;
always@(posedge clk) begin
	if (rst) shift_reg = 16'd0;
	else if (ld) shift_reg=vi;
	else if (sh_en) shift_reg= shift_reg<<1;	
		
end
assign out=shift_reg;
endmodule
	
