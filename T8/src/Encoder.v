module Encoder
(

	input [4:0] Write_Register_i,
	output reg [31:0] CP_o	
);
	always@(*) begin
	case (Write_Register_i)
	
	0	 : CP_o = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
	1	 : CP_o = 32'b0000_0000_0000_0000_0000_0000_0000_0010;
	2	 : CP_o = 32'b0000_0000_0000_0000_0000_0000_0000_0100;
	3	 : CP_o = 32'b0000_0000_0000_0000_0000_0000_0000_1000;
	4	 : CP_o = 32'b0000_0000_0000_0000_0000_0000_0001_0000;
	5	 : CP_o = 32'b0000_0000_0000_0000_0000_0000_0010_0000;
	6	 : CP_o = 32'b0000_0000_0000_0000_0000_0000_0100_0000;
	7	 : CP_o = 32'b0000_0000_0000_0000_0000_0000_1000_0000;
	8	 : CP_o = 32'b0000_0000_0000_0000_0000_0001_0000_0000;
	9	 : CP_o = 32'b0000_0000_0000_0000_0000_0010_0000_0000;
	10	 : CP_o = 32'b0000_0000_0000_0000_0000_0100_0000_0000;
	11	 : CP_o = 32'b0000_0000_0000_0000_0000_1000_0000_0000;
	12	 : CP_o = 32'b0000_0000_0000_0000_0001_0000_0000_0000;
	13	 : CP_o = 32'b0000_0000_0000_0000_0010_0000_0000_0000;
	14	 : CP_o = 32'b0000_0000_0000_0000_0100_0000_0000_0000;
	15	 : CP_o = 32'b0000_0000_0000_0000_1000_0000_0000_0000;
	16	 : CP_o = 32'b0000_0000_0000_0001_0000_0000_0000_0000;
	17	 : CP_o = 32'b0000_0000_0000_0010_0000_0000_0000_0000;
	18	 : CP_o = 32'b0000_0000_0000_0100_0000_0000_0000_0000;
	19	 : CP_o = 32'b0000_0000_0000_1000_0000_0000_0000_0000;
	20	 : CP_o = 32'b0000_0000_0001_0000_0000_0000_0000_0000;
	21	 : CP_o = 32'b0000_0000_0010_0000_0000_0000_0000_0000;
	22	 : CP_o = 32'b0000_0000_0100_0000_0000_0000_0000_0000;
	23	 : CP_o = 32'b0000_0000_1000_0000_0000_0000_0000_0000;
	24	 : CP_o = 32'b0000_0001_0000_0000_0000_0000_0000_0000;
	25	 : CP_o = 32'b0000_0010_0000_0000_0000_0000_0000_0000;
	26	 : CP_o = 32'b0000_0100_0000_0000_0000_0000_0000_0000;
	27	 : CP_o = 32'b0000_1000_0000_0000_0000_0000_0000_0000;
	28	 : CP_o = 32'b0001_0000_0000_0000_0000_0000_0000_0000;
	29	 : CP_o = 32'b0010_0000_0000_0000_0000_0000_0000_0000;
	30	 : CP_o = 32'b0100_0000_0000_0000_0000_0000_0000_0000;
	31	 : CP_o = 32'b1000_0000_0000_0000_0000_0000_0000_0000;
	

	
	endcase
	end

endmodule 
	