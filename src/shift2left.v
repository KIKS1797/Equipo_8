module shift2left (
	input [31:0] in,
	output reg [31:0] out
	);
	

always @(in) out = in << 2;

endmodule 