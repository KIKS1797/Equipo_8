module Mux4to1 #(parameter WIDTH = 32)
(
	input [WIDTH-1:0] a, b, c ,d,
	input [1:0]	S,
	
	output reg [WIDTH-1:0] out
);


//reg [WIDTH-1:0] constant = 32'b0000_0000_0000_0000_0000_0000_0000_0100;
always @(*)
begin
case (S)
2'b00 : out <= a;
2'b01 : out <= b;
2'b10 : out <= c;
2'b11 : out <= d;
endcase
end

endmodule  