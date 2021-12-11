`timescale 1ns/1ns
module Mips_milti_rb;
	reg clk;
	reg reset;
	reg PC_write;
	reg Mem_write;
	reg lorD_mux;
 	reg IR_write;
	reg Reg_Dst_mux;
	reg Mem_reg_mux;
	reg Reg_write;
	reg ALU_srcA_mux;
	reg [1:0] ALU_srcB_mux;
	reg [2:0] ALU_control;
	reg Pc_src_mux;
	reg Branch;
	wire [7:0] gpio_o;
	wire [5:0] Funct;
	wire [5:0] Op;
	wire [31:0] Funcyop;
	wire [31:0] signimm_test;
	wire [31:0] signimm_test1;
	wire [31:0] signimm_test2;
	wire [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,
			r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31;
	
Mips_multi DUV0 (.clk(clk),//
	.reset(reset),//
	.PC_write(PC_write),
	.Mem_write(Mem_write),
	.lorD_mux(lorD_mux),
	.IR_write(IR_write),
	.Reg_Dst_mux(Reg_Dst_mux),
	.Mem_reg_mux(Mem_reg_mux),
	.Reg_write(Reg_write),
	.ALU_srcA_mux(ALU_srcA_mux),
	.ALU_srcB_mux(ALU_srcB_mux),
	.ALU_control(ALU_control),
	.Pc_src_mux(Pc_src_mux),
	.Branch(Branch),
	.gpio_o(gpio_o),
	.Funct(Funct),
	.Op(Op),
////////////output monitoring
	.Funcyop(Funcyop),
	.signimm_test(signimm_test),
	.signimm_test1(signimm_test1),
	.signimm_test2(signimm_test2),
	.r0(r0),
.r1(r1),
.r2(r2),
.r3(r3),
.r4(r4),
.r5(r5),
.r6(r6),
.r7(r7),
.r8(r8),
.r9(r9),
.r10(r10),
.r11(r11),
.r12(r12),
.r13(r13),
.r14(r14),
.r15(r15),
.r16(r16),
.r17(r17),
.r18(r18),
.r19(r19),
.r20(r20),
.r21(r21),
.r22(r22),
.r23(r23),
.r24(r24),
.r25(r25),
.r26(r26),
.r27(r27),
.r28(r28),
.r29(r29),
.r30(r30),
.r31(r31)

);

initial begin
	clk = 0;
	reset = 0;
	#10 reset = 1;
	forever #10 clk = ~clk;
	end

initial begin
	#0
	lorD_mux = 0;
        Mem_write = 0;
	IR_write = 0;

	Reg_Dst_mux = 0;
	Mem_reg_mux = 0;

	PC_write = 0;
	Branch = 0;
	Pc_src_mux = 0;
	ALU_control = 000;
	ALU_srcA_mux = 1;
	ALU_srcB_mux = 00;
	Reg_write = 0;
	#40/////////////////////////////////7
	ALU_srcA_mux = 1;
	ALU_srcB_mux = 10;
	IR_write = 1;
	#20
	IR_write = 0;
	#20
	Reg_write = 1;
	#20
	Reg_write = 0;
	#20
	ALU_srcA_mux = 0;
	ALU_srcB_mux = 01;
	#20
	PC_write = 1;
	#20
	PC_write = 0;
	ALU_srcA_mux = 1;
	ALU_srcB_mux = 10;///////
	#20
	IR_write = 1;
	#20
	IR_write = 0;
	#20
	Reg_write = 1;
	#20
	Reg_write = 0;
	#20
	ALU_srcA_mux = 0;
	ALU_srcB_mux = 01;
	#20
	PC_write = 1;
	#20
	PC_write = 0;/////
	ALU_srcA_mux = 1;
	ALU_srcB_mux = 10;
	#20
	IR_write = 1;
	#20
	IR_write = 0;
	#20
	Reg_write = 1;
	#20
	Reg_write = 0;
	#20
	ALU_srcA_mux = 0;
	ALU_srcB_mux = 01;
	#20
	PC_write = 1;
	#20
	PC_write = 0;
	ALU_srcA_mux = 1;
	ALU_srcB_mux = 10;
	#20
/////////////////////////////////////
	IR_write = 1;
	#20
	IR_write = 0;
	Reg_Dst_mux = 1;

		
end
initial begin

end
endmodule 
	