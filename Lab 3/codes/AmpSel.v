module AmpSel ( input [7:0] in ,input [1:0] sw65, output [7:0] out);
assign out=(sw65==2'd0)?in:
	(sw65==2'd1)?(in/2):
	(sw65==2'd2)?(in/4):
	(sw65==2'd3)?(in/8):in;
endmodule
