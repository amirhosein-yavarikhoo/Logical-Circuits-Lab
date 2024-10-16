module wrapper_cu (input clk,rst,start,eng_done,co,output reg done,wr_req,sh_en,ld,eng_start,ui_reg_ld,cnt_en,cnt_rst);
  reg [2:0] ps, ns;
  parameter [2:0]
  S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5=5;
  always@(ps, start, eng_done, co)begin
    ns = S0;
    case(ps)
      S0:
        ns = (start)? S1 : S0;
      S1:
        ns = (start)? S1 : S2;
      S2:
        ns = S3;
      S3:
        ns = S4;
      S4: ns = (eng_done) ? ((~co)?S5:S0):S4;
      S5:
        ns = S3;
    endcase
  end

  always@(ps, start, eng_done, co)begin
  done = 1'b0; wr_req = 1'b0; sh_en = 1'b0; ld = 1'b0; eng_start = 1'b0; ui_reg_ld = 1'b0; cnt_rst=1'b0;
	cnt_en=1'b0;
  case(ps)
      S0:begin
	cnt_rst=1'b1;
	done=1'b1;
      end
      S1: begin

      end
      S2:begin
        ld = 1'b1;
        ui_reg_ld = 1'b1;
      end
      S3:begin
        eng_start = 1'b1;
      end
      S4:begin
      end
      S5:begin
        wr_req =1'b1;
        sh_en = 1'b1;
 	cnt_en = 1'b1;
      end
    endcase
  end

  always@(posedge clk,posedge rst)begin
    if(rst == 1'b1)
      ps <= S0;
    else
      ps <= ns;
  end
endmodule
