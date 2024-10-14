module handrom ( input [7:0] addr, input clk, output reg [7:0] data);
reg [7:0] memory [0:255];
initial begin
    $readmemh("data1.mif", memory);
end

always @(posedge clk) begin
    data <= memory[addr];
end

endmodule