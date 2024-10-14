module twocounter (input clk,rst,en,output reg co);
reg [1:0] count;
always @(posedge clk) begin
	if (rst)begin count=2'd0; co=1'b0; end
	else if (en) {co,count}=count+1'b1;
end
endmodule