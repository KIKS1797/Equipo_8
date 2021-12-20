`timescale 1ns/1ns
module TB_ADDyADDI;
	reg clk;
	reg [1:0]sw;
	wire [9:0] ledr;

Mips_AddaddiWrap DUV (.MAX10_CLK1_50(clk), .SW(sw), .LEDR(ledr));

initial begin 
	#0
	clk = 0;
	forever #10 clk = ~clk;
end
initial begin 
	#0
	#20 sw[0] = 1;
	sw[1] = 0;
	#20 sw[0] = 0;
	#20 sw[0] = 1;
end
endmodule 