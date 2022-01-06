module Register_File //MIPS 
#(
	parameter N_bits = 32
)
(
	input clk,
	input reset,
	input 		Reg_Write_i, //Enable Write
	input [4:0]	Read_Register_1_i,
	input [4:0]	Read_Register_2_i,
	input [4:0]	Write_Register_i,
	input [N_bits-1:0]	Write_Data_i,
	
	output [N_bits-1:0]	Read_Data_1_i,
	output [N_bits-1:0]	Read_Data_2_i
);

wire [N_bits-1:0] Q [0:31];
wire [N_bits-1:0] CP_out;

Registers32 reg32 (.Rd(Write_Data_i), .clk(clk), .reset(reset), .Reg_Write_i(Reg_Write_i), .CP_o(CP_out), .Q(Q[0]), 
						.Q1(Q[1]), .Q2(Q[2]), .Q3(Q[3]), .Q4(Q[4]), .Q5(Q[5]), .Q6(Q[6]), .Q7(Q[7]), .Q8(Q[8]),
						.Q9(Q[9]), .Q10(Q[10]), .Q11(Q[11]), .Q12(Q[12]), .Q13(Q[13]), .Q14(Q[14]), .Q15(Q[15]),
						.Q16(Q[16]), .Q17(Q[17]), .Q18(Q[18]), .Q19(Q[19]), .Q20(Q[20]), .Q21(Q[21]), .Q22(Q[22]), .Q23(Q[23]),
						.Q24(Q[24]), .Q25(Q[25]), .Q26(Q[26]), .Q27(Q[27]), .Q28(Q[28]), .Q29(Q[29]), .Q30(Q[30]), .Q31(Q[31]));

Mux32to1 Mux32 (.a0(Q[0]), .a1(Q[1]), .a2(Q[2]), .a3(Q[3]), .a4(Q[4]), .a5(Q[5]), .a6(Q[6]), .a7(Q[7]), .a8(Q[8]), .a9(Q[9]), 
						.a10(Q[10]), .a11(Q[11]), .a12(Q[12]), .a13(Q[13]), .a14(Q[14]), .a15(Q[15]), .a16(Q[16]), .a17(Q[17]), 
						.a18(Q[18]), .a19(Q[19]), .a20(Q[20]), .a21(Q[21]), .a22(Q[21]), .a23(Q[23]), .a24(Q[24]), .a25(Q[25]), 
						.a26(Q[26]), .a27(Q[27]), .a28(Q[28]), .a29(Q[29]), .a30(Q[30]), .a31(Q[31]), .s(Read_Register_1_i), .out(Read_Data_1_i));
				  

Mux32to1 Mux32_2 (.a0(Q[0]), .a1(Q[1]), .a2(Q[2]), .a3(Q[3]), .a4(Q[4]), .a5(Q[5]), .a6(Q[6]), .a7(Q[7]), .a8(Q[8]), .a9(Q[9]), 
						.a10(Q[10]), .a11(Q[11]), .a12(Q[12]), .a13(Q[13]), .a14(Q[14]), .a15(Q[15]), .a16(Q[16]), .a17(Q[17]), 
						.a18(Q[18]), .a19(Q[19]), .a20(Q[20]), .a21(Q[21]), .a22(Q[21]), .a23(Q[23]), .a24(Q[24]), .a25(Q[25]), 
						.a26(Q[26]), .a27(Q[27]), .a28(Q[28]), .a29(Q[29]), .a30(Q[30]), .a31(Q[31]), .s(Read_Register_2_i), .out(Read_Data_2_i));
						
Encoder encoder  (.Write_Register_i(Write_Register_i), .CP_o(CP_out));

endmodule 
