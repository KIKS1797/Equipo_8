module Registers32 #(parameter WIDTH = 32)
(
	input [WIDTH-1:0] Rd,
	input clk, reset,
	input RegWriteI,
	input [WIDTH-1:0] CP_o,
	
	output [WIDTH-1:0] Q, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8,
							Q9, Q10, Q11, Q12, Q13, Q14, Q15,
							Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, 
							Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31	
);
wire [WIDTH-1:0] Enable_dec;

generate
	genvar i;
		for (i = 0; i < WIDTH; i = i+1)
		begin: Reg
			and dec (Enable_dec[i], RegWriteI, CP_o[i]);
		end
endgenerate

FlipFlop Reg1 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[0]), .Q(Q));
FlipFlop Reg2 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[1]), .Q(Q1));
FlipFlop Reg3 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[2]), .Q(Q2));
FlipFlop Reg4 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[3]), .Q(Q3));
FlipFlop Reg5 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[4]), .Q(Q4));
FlipFlop Reg6 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[5]), .Q(Q5));
FlipFlop Reg7 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[6]), .Q(Q6));
FlipFlop Reg8 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[7]), .Q(Q7));
FlipFlop Reg9 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[8]), .Q(Q8));
FlipFlop Reg10 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[9]), .Q(Q9));
FlipFlop Reg11 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[10]), .Q(Q10));
FlipFlop Reg12 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[11]), .Q(Q11));
FlipFlop Reg13 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[12]), .Q(Q12));
FlipFlop Reg14 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[13]), .Q(Q13));
FlipFlop Reg15 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[14]), .Q(Q14));
FlipFlop Reg16 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[15]), .Q(Q15));
FlipFlop Reg17 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[16]), .Q(Q16));
FlipFlop Reg18 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[17]), .Q(Q17));
FlipFlop Reg19 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[18]), .Q(Q18));
FlipFlop Reg20 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[19]), .Q(Q19));
FlipFlop Reg21 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[20]), .Q(Q20));
FlipFlop Reg22 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[21]), .Q(Q21));
FlipFlop Reg23 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[22]), .Q(Q22));
FlipFlop Reg24 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[23]), .Q(Q23));
FlipFlop Reg25 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[24]), .Q(Q24));
FlipFlop Reg26 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[25]), .Q(Q25));
FlipFlop Reg27 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[26]), .Q(Q26));
FlipFlop Reg28 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[27]), .Q(Q27));
FlipFlop Reg29 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[28]), .Q(Q28));
FlipFlop Reg30 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[29]), .Q(Q29));
FlipFlop Reg31 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[30]), .Q(Q30));
FlipFlop Reg32 (.D(Rd), .clk(clk), .reset(reset), .enable(Enable_dec[31]), .Q(Q31));

endmodule 