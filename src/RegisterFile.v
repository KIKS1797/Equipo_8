module RegisterFile
	#(
	parameter width32 = 32,
	parameter width5 = 5
	)(
	/*input [width5-1:0] rs, rt, rd,
	input [width32-1:0] data,
	input clk, regwrite, enable, //rst
	output rs_out, rt_out*/
	input 					clk,//
	input 					enable, rst_n,
	input 					Reg_Write_i,//
	input [4:0] 			Write_Register_i,//
	input [4:0] 			Read_Register_1_i,//
	input [4:0] 			Read_Register_2_i,//
	input [width32-1:0]  Write_Data_i, SW1, SW2,//SW1, SW2 se eleimiran estan como estrada de lo smux
	
	output [width32-1:0] Read_Data_1_o,//
	output [width32-1:0] Read_Data_2_o,//
	output [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,
			r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31
	);
//r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,
			//r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31
	//wires to connect the outputs
	wire [width32-1:0] WriteRegisteri;
	wire [width32-1:0] onehot;
	wire [width32-1:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,
	w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,
	w22,w23,w24,w25,w26,w27,w28,w29,w30,w31;
	//

assign r0 = w0;
assign r1 = w1;
assign r2 = w2;
assign r3 = w3;
assign r4 = w4;
assign r5 = w5;
assign r6 = w6;
assign r7 = w7;
assign r8 = w8;
assign r9 = w9;
assign r10 = w10;
assign r11 = w11;
assign r12 = w12;
assign r13 = w13;
assign r14 = w14;
assign r15 = w15;
assign r16 = w16;
assign r17 = w17;
assign r18 = w18;
assign r19 = w19;
assign r20 = w20;
assign r21 = w21;
assign r22 = w22;
assign r23 = w23;
assign r24 = w24;
assign r25 = w25;
assign r26 = w26;
assign r27 = w27;
assign r28 = w28;
assign r29 = w29;
assign r30 = w30;
assign r31 = w31;

	mux2to1 mu0 (.I1(Write_Data_i), .Sel(enable), .Data_out(WriteRegisteri));
	// decoder 5 to 32 bit, output as onehot
	dec3to8 dec0 (.e(enable), .a(Write_Register_i), .d(onehot));
	//totalref takes input clock, regwrite as activation bit, writedata as 32bit, en decoder output onehot
	totalreg tr0 (.clk(clk), .regwrite(Reg_Write_i), .data(WriteRegisteri), .cp(onehot),.rst_n(rst_n),
	.Q0(w0), .Q1(w1),.Q2(w2),.Q3(w3),.Q4(w4),.Q5(w5),.Q6(w6),.Q7(w7),.Q8(w8),
	.Q9(w9),.Q10(w10),.Q11(w11),.Q12(w12),.Q13(w13),.Q14(w14),.Q15(w15),.Q16(w16),
	.Q17(w17),.Q18(w18),.Q19(w19),.Q20(w20),.Q21(w21),.Q22(w22),.Q23(w23),.Q24(w24),
	.Q25(w25),.Q26(w26),.Q27(w27),.Q28(w28),.Q29(w29),.Q30(w30),.Q31(w31));
	//demux 32to1 obtiene el valor en bianrio de 5bits, y selecciona la salida de 32bits para read data 1
	Mux32to1 mux0 (.Sel(Read_Register_1_i), .Data_out(Read_Data_1_o), .I0(w0),.I1(w1),.I2(w2),.I3(w3),.I4(w4),
	.I5(w5),.I6(w6),.I7(w7),.I8(w8),.I9(w9),.I10(w10),.I11(w11),.I12(w12),.I13(w13),.I14(w14),
	.I15(w15),.I16(w16),.I17(w17),.I18(w18),.I19( SW1       /*w19*/),.I20(w20),.I21(w21),.I22(w22),.I23(w23),
	.I24(w24),.I25(w25),.I26(w26),.I27(w27),.I28(w28),.I29(w29),.I30(w30),.I31(w31));
	//demux 32to1 obtiene el valor en bianrio de 5bits, y selecciona la salida de 32bits para read data 2
	Mux32to1 mux1 (.Sel(Read_Register_2_i), .Data_out(Read_Data_2_o), .I0(w0),.I1(w1),.I2(w2),.I3(w3),.I4(w4),
	.I5(w5),.I6(w6),.I7(w7),.I8(w8),.I9(w9),.I10(w10),.I11(w11),.I12(w12),.I13(w13),.I14(w14),
	.I15(w15),.I16(w16),.I17(w17),.I18(w18),.I19( SW2      /*w19*/),.I20(w20),.I21(w21),.I22(w22),.I23(w23),
	.I24(w24),.I25(w25),.I26(w26),.I27(w27),.I28(w28),.I29(w29),.I30(w30),.I31(w31));
	
endmodule 