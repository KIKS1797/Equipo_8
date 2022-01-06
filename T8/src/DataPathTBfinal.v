module DataPathTBfinal;

reg CLK = 0;
reg Reset;
reg  [7:0] GPIO_I;
wire [7:0] GPIO_O;
wire CLKs;

Data_Path DP (.clk(CLK), .reset(Reset), .GPIO_i(GPIO_I), .clk_signal(CLKs), .GPIO_o(GPIO_O));

initial 
begin
	forever #3 CLK = !CLK;
end

initial begin
	#1 Reset = 1'b1;
	#5 Reset = 1'b0;
	#5 Reset = 1'b1;
	GPIO_I = 8'h03;
end
endmodule 