module RegisterWrite #(parameter WIDTH = 32)
(
	input [WIDTH-1:0] D,
	input clk, reset,
	output [WIDTH-1:0] Q 
);

FlipFlofWrite Reg (.D(D), .reset(reset), .clk(clk), .Q(Q));
endmodule 