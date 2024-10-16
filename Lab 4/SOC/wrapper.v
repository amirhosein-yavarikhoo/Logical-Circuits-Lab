module wrapper (input clk,start,rst,input [1:0]ui,input[4:0] vi,output wr_req,output [20:0] wr_data,output done);
wire [15:0] shift_reg_input;
assign shift_reg_input={3'b000,vi,8'b00000000};
wire [15:0] exp_input,exp_frac;
wire [1:0] exp_int,ui_out;
wire exp_done,ui_load,sh_en,shift_reg_load,exp_start,shift_reg_en,count_en,rst_count,count_co;
exponential expo (clk,rst,exp_start,exp_input,exp_done,exp_int,exp_frac);
shiftComb shiftcomb (ui_out,{exp_int,exp_frac},wr_data);
Register ui_reg (clk,rst,ui_load,ui,ui_out);
shiftReg shiftreg (clk,rst,shift_reg_en,shift_reg_load,shift_reg_input,exp_input);
wrapper_cu cu (clk,rst,start,exp_done,count_co,done,wr_req,shift_reg_en,shift_reg_load,exp_start,ui_load,count_en,rst_count);
twocounter count (clk,rst_count,count_en,count_co);
endmodule
