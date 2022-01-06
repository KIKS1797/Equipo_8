module Data_Path
(
	input clk, reset,
	input [7:0] GPIO_i,
	
	output [7:0] GPIO_o,
	output clk_signal
);

wire [31:0]	PCout, DataRegOut, MuxRegFile, PCSrcOut, PC_ALU, Dat1Out, Dat2Out, RegAout, RegBout, MuxAout, 
				MemOut, InsRegOut, Src_A, Src_B, AluMOut, RegALUout, SignExtOut, ZeroExtOut, MuxZSout;
			
wire [7:0] 	GPIORegOut;
			
wire [4:0]	Mux2_o;

wire	PCen, Branch, PC_W, AND_o, MuxJump, Zero, RegFileEn, AddressSel, MemSysEn, RegInsEn, MuxAluSrcA, 
		MuxPCSrc, RegFileWriteDat, GPIOenable;
		
wire [1:0] 	MuxAluSrcB, MuxRegFileWriteDat, MuxZeroExt;
				
wire [2:0] 	MuxOperationAlu;

PC PC(.D(PCSrcOut), .clk(clk), .reset(reset), .enable(PCen), .Q(PCout));

Mux2to1	ToAddress(.a(AluMOut), .b(PCout), .s(AddressSel), .out(MuxAout));
Mux2to1		MuxRegFileData(.a(DataRegOut), .b(RegALUout), .s(RegFileWriteDat), .out(MuxRegFile));
Mux2to1		PCsrc(.a(RegALUout), .b(AluMOut), .s(MuxPCSrc), .out(PC_ALU));
Mux2to1		PCJump(.a(PC_ALU), .b({ PCout[31:28], InsRegOut[25:0], {2{1'b0}} }), .s(MuxJump), .out(PCSrcOut));
Mux2to1		AluSrcA(.a(RegAout), .b(PCout), .s(MuxAluSrcA), .out(Src_A));
Mux4to1	#(.WIDTH(32)) AluSrcB(.a(RegBout), .b(32'b0000_0000_0000_0000_0000_0000_0000_0100), .c(MuxZSout), .d({ MuxZSout[29:0], 2'b0}), .S(MuxAluSrcB), .out(Src_B));
Mux4to1		GPIOsign(.a(SignExtOut), .b(ZeroExtOut), .c( { InsRegOut[15:0], {16{1'b0}} }), .d({{24{GPIO_i[7]}},GPIO_i}), .S(MuxZeroExt), .out(MuxZSout));
Mux4to1	#(.WIDTH(5))	MuxRegFiles(.a(InsRegOut[20:16]), .b(InsRegOut[15:11]), .c(5'b11111), .d(5'b00000), .S(MuxRegFileWriteDat), .out(Mux2_o));

FlipFlop 	#(.WIDTH(8)) GPIOout(.D(GPIORegOut), .clk(clk), .reset(reset), .enable(GPIOenable), .Q(GPIO_o));

MemorySystem	Memory(.write_enable_i(MemSysEn), .clock(clk), .Write_Data(RegBout), .Address_i(MuxAout), .Instruction_o(MemOut)); 

Register RegInst(.Rd(MemOut), .clk(clk), .reset(reset), .enable(RegInsEn), .Q1(InsRegOut));
RegisterWrite RegData(.D(MemOut), .clk(clk), .reset(reset), .Q(DataRegOut));
RegisterFile RF(.clk(clk), .reset(reset), .RegWrite(RegFileEn), .ReadRegister1(InsRegOut[25:21]), .ReadRegister2(InsRegOut[20:16]), 
						.WriteRegister(Mux2_o), .WriteData(MuxRegFile), .ReadData1(Dat1Out), .ReadData2(Dat2Out));
RegisterWrite 	Data_A(.D(Dat1Out), .clk(clk), .reset(reset), .Q(RegAout));
RegisterWrite 	Data_B(.D(Dat2Out), .clk(clk), .reset(reset), .Q(RegBout));
RegisterWrite 	AluOut(.D(AluMOut), .clk(clk), .reset(reset), .Q(RegALUout));

ALU AluModule(.data_a(Src_A), .data_b(Src_B), .select(MuxOperationAlu), .y(AluMOut), .zero(Zero));

Sign_Extend		SignE(.x(InsRegOut[15:0]), .y(SignExtOut));
Zero_extend 		ZeroE(.GPIO_i(InsRegOut[15:0]), .Zero_Ext(ZeroExtOut)); 


ControlUnit FSM(.clk(clk), .rst(reset), .Op(InsRegOut[31:26]), .Funct(InsRegOut[5:0]), .InsDat(AddressSel),
					.Mem_W(MemSysEn), .IR_W(RegInsEn), .PC_W(PC_W), .PC_Src(MuxPCSrc), .Branch(Branch), .ALU_A(MuxAluSrcA),
					.Reg_W(RegFileEn), .Mem_Reg(RegFileWriteDat), .Reg_Dst(MuxRegFileWriteDat),.PCJump(MuxJump),
					.ALU_Ctrl(MuxOperationAlu), .ALU_B(MuxAluSrcB), .Zero_Ext(MuxZeroExt), .GPIO_o(GPIOenable));

and Comp1 (AND_o, Branch, Zero);
or Comp2 (PCen, PC_W, AND_o);

assign GPIORegOut[7] = AluMOut[7];
assign GPIORegOut[6] = AluMOut[6];
assign GPIORegOut[5] = AluMOut[5];
assign GPIORegOut[4] = AluMOut[4];
assign GPIORegOut[3] = AluMOut[3];
assign GPIORegOut[2] = AluMOut[2];
assign GPIORegOut[1] = AluMOut[1];
assign GPIORegOut[0] = AluMOut[0];
endmodule 
