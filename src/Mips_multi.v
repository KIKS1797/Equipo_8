module Mips_multi(
	input clk,
	input reset,
	
	input PC_write, // pc register enable
	input Mem_write, //enable for ram memory
	input lorD_mux, //first mux addr
	input IR_write, // second register for operation 
	/////second part register file and on.
	///// Falta el input de el mux que no aparece
	input Reg_Dst_mux,
	input Mem_reg_mux,
	input Reg_write,
	input ALU_srcA_mux,
	input [1:0] ALU_srcB_mux,
	input [2:0] ALU_control,
	input Pc_src_mux,
	input Branch,
	
	output [7:0] gpio_o,
	output [5:0] Funct, Op,
	output [31:0] Funcyop, signimm_test, signimm_test1, signimm_test2,////monitoring signals
	output [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,
			r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31
);

wire [31:0] PC_o, Mem_o,Fetch_parts_o, Fetch_no_mod,
Mem_i, Mux_alu_o, ALU_out, RF_o_B, data_wd3,
data_o_A, data_o_B, RF_o_A, SrcA_ALU_in, SrcB_ALU_in, 
ALU_result, Sign_ex;
wire [4:0] in_A3;
wire Z, w1, Pc_en;

wire [31:0] r00,r10a,r20a,r30a,r40,r50,r60,r70,r80,r90,r100,r110,r120,r130,r140,r150,
			r160,r170,r180,r190,r200,r210,r220,r230,r240,r250,r260,r270,r280,r290,r300,r310;

and and1 (w1, Branch, Z);
or  or1 (Pc_en, w1, PC_write);

One_register PC (.clk(clk), // Program Counter register
						.rst(reset), 
						.enable(Pc_en), 
						.data(Mux_alu_o), 
						.one_register_o(PC_o));
						
mux2to1a mux_pc_mem (.I1(ALU_out), //mux para definir la entrada de la memoria
						.I0(PC_o), 
						.Sel(lorD_mux), 
						.Data_out(Mem_i));
						
memory_system Mem_0 (.write_enable_i(Mem_write), 
						.write_data(RF_o_B),
						.address_i(Mem_i), 
						.instruction_o(Mem_o),
						.clk(clk));
						
One_register IRWrite (.clk(clk), // Fetch to break a part data register, 
						.rst(reset), 
						.enable(IR_write), 
						.data(Mem_o), 
						.one_register_o(Fetch_parts_o));
						
assign Op = Fetch_parts_o[31:26];
assign Funct = Fetch_parts_o[5:0];
assign Funcyop = Fetch_parts_o;
						
One_register No_enable (.clk(clk), // Not modified Fetch
						.rst(reset), 
						.enable(1'b1), 
						.data(Mem_o), 
						.one_register_o(Fetch_no_mod));			
						
mux2to1a #(.DW(5)) mux_A3 (.I1(Fetch_parts_o[15:11]), //mux for A3
						.I0(Fetch_parts_o[20:16]), 
						.Sel(Reg_Dst_mux), 
						.Data_out(in_A3));
						
mux2to1a mux_WD3 (.I1(Fetch_no_mod), //mux for WD3
						.I0(ALU_out), 
						.Sel(Mem_reg_mux), 
						.Data_out(data_wd3));
						
RegisterFile reg_file (.clk(clk), 
						.enable(1'b1), 
						.Reg_Write_i(Reg_write), 
						.Write_Register_i(in_A3), 
						.Read_Register_1_i(Fetch_parts_o[25:21]), 
						.Read_Register_2_i(Fetch_parts_o[20:16]), 
						.Write_Data_i(data_wd3), //mux output
						.Read_Data_1_o(data_o_A), 
						.Read_Data_2_o(data_o_B),
						.rst_n(reset),
						.r0(r00),
.r1(r10a),
.r2(r20a),
.r3(r30a),
.r4(r40),
.r5(r50),
.r6(r60),
.r7(r70),
.r8(r80),
.r9(r90),
.r10(r100),
.r11(r110),
.r12(r120),
.r13(r130),
.r14(r140),
.r15(r150),
.r16(r160),
.r17(r170),
.r18(r180),
.r19(r190),
.r20(r200),
.r21(r210),
.r22(r220),
.r23(r230),
.r24(r240),
.r25(r250),
.r26(r260),
.r27(r270),
.r28(r280),
.r29(r290),
.r30(r300),
.r31(r310));					
//////////////////////////////////////////////77
sign_extend sign1 (.y(Sign_ex), 
		.x(Fetch_parts_o[15:0]));

assign signimm_test = PC_o;//ALU_result  Sign_ex
assign signimm_test1 = SrcA_ALU_in;
assign signimm_test2 = SrcB_ALU_in;//
	
///reservado para el sign extend, signImm
/////////////////////////////////////////////////
						
One_register two_input_reg1 (.clk(clk), // Register File, register out1
						.rst(reset), 
						.enable(1'b1), 
						.data(data_o_A), 
						.one_register_o(RF_o_A));

One_register two_input_reg2 (.clk(clk), // Register File, register out2
						.rst(reset), 
						.enable(1'b1), 
						.data(data_o_B), 
						.one_register_o(RF_o_B));
						
mux2to1a PC_SrcA (.I1(RF_o_A), //
						.I0(PC_o), 
						.Sel(ALU_srcA_mux), 
						.Data_out(SrcA_ALU_in));

mux4to1 PC_SrcB (.I0(RF_o_B), //
						.I1(4),
						.I2(Sign_ex),
						.I3(/*shift 2bits*/0),
						.Sel(ALU_srcB_mux), 
						.Data_out(SrcB_ALU_in));
						
ALU alu1 		(.y(ALU_result), // ZERO out pending
						.a(SrcA_ALU_in), //32'b00000000_00000000_00000000_00000111), //pending       SrcA_ALU_in
						.b(SrcB_ALU_in), //pending
						//.c_in(0), ///////////////7
						.select(/*ALU_control*/4'b0010),
						.Z(Z));
						
assign gpio_o = ALU_result[7:0];
												
One_register ALU_out_reg (.clk(clk), // Register ALU out
						.rst(reset), 
						.enable(1'b1), 
						.data(ALU_result), 
						.one_register_o(ALU_out));
						
mux2to1a ALU_o (.I1(ALU_out), //
						.I0(ALU_result), 
						.Sel(Pc_src_mux), 
						.Data_out(Mux_alu_o));
						

assign r0 = r00;
assign r1 = r10a;
assign r2 = r20a;
assign r3 = r30a;
assign r4 = r40;
assign r5 = r50;
assign r6 = r60;
assign r7 = r70;
assign r8 = r80;
assign r9 = r90;
assign r10 = r100;
assign r11 = r110;
assign r12 = r120;
assign r13 = r130;
assign r14 = r140;
assign r15 = r150;
assign r16 = r160;
assign r17 = r170;
assign r18 = r180;
assign r19 = r190;
assign r20 = r200;
assign r21 = r210;
assign r22 = r220;
assign r23 = r230;
assign r24 = r240;
assign r25 = r250;
assign r26 = r260;
assign r27 = r270;
assign r28 = r280;
assign r29 = r290;
assign r30 = r300;
assign r31 = r310;
endmodule 