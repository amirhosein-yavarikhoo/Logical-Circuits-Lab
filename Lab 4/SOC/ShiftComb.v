module shiftComb(input[1:0] shiftNum, input[17:0] in, output [20:0] out);
assign out = {3'b000,in} << shiftNum;
endmodule
	
