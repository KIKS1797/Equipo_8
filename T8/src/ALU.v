module ALU #(parameter WIDTH = 32)
(
	input		[WIDTH-1: 0]	data_a, data_b,
	input		[2: 0]	select,
	
	output reg [WIDTH-1: 0] y,
	output reg zero
);		 


always @ (*)
begin
y = 32'b0;
case (select)
3'b001:	y = data_a + data_b;
3'b010:	y = data_a & data_b;
3'b011:	y = data_a | data_b;
3'b100: 	y = data_a ^ data_b;
3'b101:	y = (data_a < data_b) ? 32'h01 : 32'h00;
3'b110:	y = data_a * data_b;			
3'b111:	y = data_a;  
/*			4'b000110:	y = a - 1'b1;
			4'b000111:	y = b;
			4'b001000:	y = a & b;
			4'b001010:	y = a | b;
			4'b001100:  y = a ^ b;
			4'b001110:	y = ~a;
			4'b010000:	y = a << 1;
			4'b100000:	y = a >> 1;			// 16
			4'b110000:	y = 0;            // 24*/         
default:		y = 4'b0;
endcase
zero = (y == 32'h0) ? 1'b1 : 1'b0;
end

endmodule
