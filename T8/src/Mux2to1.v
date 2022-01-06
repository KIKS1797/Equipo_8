module Mux2to1
#(
	parameter WIDTH = 32
)
(
	input [WIDTH-1:0] a, b,
	input s,
	output [WIDTH-1:0] out
);

assign out = (s) ? a : b;

endmodule 