module Zero_extend #(parameter WIDTH_i = 16, parameter WIDTH_o = 32)
(
	input 		[WIDTH_i-1:0] GPIO_i,
	output wire 	[WIDTH_o-1:0] Zero_Ext
);

assign	Zero_Ext = { {16{1'b0}}, GPIO_i};
endmodule
