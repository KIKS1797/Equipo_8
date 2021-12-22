module ALU
(		 // ARITHMETIC UNIT
	output 	reg [31: 0] 	y,
	output   reg		   Z,
	input		[31: 0]	a, b,//input		c_in;
	input		[2: 0]	select

	//reg		[31: 0]	y,
	//reg               Z
);

always @ (*)
	begin
	//y= 4'b0;
		case (select)
			3'b000:	y = a & b;
			3'b001:	y = a | b;
			3'b010:	y = a + b;
			3'b110:	y = a - b;
			3'b111:	y = (a < b) ? 1 : 0;
			3'b100:	y = ~(a | b);
			/*4'b000110:	y = a - 1'b1;
			4'b000111:	y = b;
			4'b001000:	y = a & b;
			4'b001010:	y = a | b;
			4'b001100:  y = a ^ b;
			4'b001110:	y = ~a;
			4'b010000:	y = a << 1;
			4'b100000:	y = a >> 1;			// 16
			4'b110000:	y = 0;            // 24*/
			default:		y = 4'b010;
		endcase
	end
always @ (y)
	begin
		case (y)
			32'b00000000_00000000_00000000 : Z = 1'b1;
			default: Z = 1'b0;
		endcase
	end
endmodule 