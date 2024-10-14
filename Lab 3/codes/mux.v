module mux ( input [7:0] in1, in2, in3, in4, in5, in6, in7, in8, input [2:0] sw97, output [7:0] out);
assign out= (sw97==3'd0)?in1:
	(sw97==3'd1)?in2:
	(sw97==3'd2)?in3:
	(sw97==3'd3)?in4:
	(sw97==3'd4)?in5:
	(sw97==3'd5)?in6:
	(sw97==3'd6)?in7:
	(sw97==3'd7)?in8:8'd0;
endmodule
