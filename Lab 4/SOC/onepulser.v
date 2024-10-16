module one_pulser( input clk, rst, clkPB, output reg clkEn );
    reg [1:0] ps, ns;

    always @(posedge clk, posedge rst) begin

 ns = 2'b0; 
 case (ps) 
  2'b0 :       ns = clkPB ? 2'b01 : 2'b0;  
  2'b01 : begin ns = 2'b10; clkEn = 1'b1; end 
  2'b10 : begin ns =  clkPB ? 2'b10 : 2'b0; clkEn = 1'b0; end
  default: ns = 2'b0; 
  endcase
    end
 always @(posedge clk, posedge rst) begin 
 if(rst) 
  ps <= 2'b0 ;
 else  
  ps <= ns;
    end
endmodule