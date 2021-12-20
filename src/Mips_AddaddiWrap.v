module Mips_AddaddiWrap(MAX10_CLK1_50, SW, LEDR);
	input MAX10_CLK1_50;
	input [1:0] SW;
	output [9:0] LEDR;
	
wire segundo, PC_write, 
	 Mem_write, 
	 lorD_mux, 
	 IR_write,  
	 Reg_Dst_mux,
	 Mem_reg_mux,
	 Reg_write,
	 ALU_srcA_mux,  
	Pc_src_mux, 
	Branch;

wire [5:0] Funct, Op;
	 
wire [1:0] ALU_srcB_mux;
wire [2:0] ALU_control;
wire [7:0] GPio;
wire z;
	
cont_1s c1 (
	.mclk(MAX10_CLK1_50), 
	.reset(SW[0]), 
	.SEGUNDO(segundo)
	);


//assign LEDR[9] = segundo;
assign LEDR[9] = segundo;//;//1'b0;////MAX10_CLK1_50;
assign LEDR[8] = SW[0];
	
FSM_Mips fsm1(
	 .Funct(Funct),
	 .op(Op),
	 .clock(segundo/*MAX10_CLK1_50*/),/////sustituto de segundos max10 directo
	 .z(z),
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
	 .rst(SW[0])
	 );
	 
Mips_multi mi1(
	 .clk(segundo/*MAX10_CLK1_50*/), //sustituto de segundo masx10  directo
	 .reset(SW[0]),
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
	 .Funct(Funct),
	 .Op(Op),
	 .gpio_o(LEDR[7:0])
	 );

assign GPio = LEDR[7:0];
	 
endmodule 