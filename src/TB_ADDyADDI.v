`timescale 1ns/1ns
module TB_ADDyADDI;
	reg clk;
	reg [9:0]sw;
	wire [9:0] ledr;

Mips_AddaddiWrap DUV (.MAX10_CLK1_50(clk), .SW(sw), .LEDR(ledr));

initial begin 
	#0
	clk = 0;
	forever #10 clk = ~clk;
end
initial begin 
	#0
	#20 sw = 10'b0;
	sw[9] = 0;
	#20 sw[9] = 0;
	#20 sw[9] = 1;//reset
	#2000 sw[8:0] = 9'd2;
	#2000 sw[8:0] = 9'd0;
	#2000 sw[8:0] = 9'd4;
	#2000 sw[8:0] = 9'd0;
	#2000 sw[8:0] = 9'd3;
end
endmodule 