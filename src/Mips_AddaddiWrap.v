module Mips_AddaddiWrap(MAX10_CLK1_50, SW, LEDR);
	input MAX10_CLK1_50;
	input [9:0] SW;
	output [9:0] LEDR;
	
wire segundo, PC_write, 
	 Mem_write,
	 lorD_mux,
	 IR_write,
	 Reg_Dst_mux,
	 Mem_reg_mux,
	 Reg_write,
	 ALU_srcA_mux,
	 c0_sig, ALU_reg_write,
	Branch;

wire [5:0] Funct, Op;
	 
wire [1:0] ALU_srcB_mux,Pc_src_mux ;
wire [2:0] ALU_control;
wire [7:0] GPio;
wire z;

PLL_Mips	PLL_Mips_inst (
	//.areset ( SW[9] ),
	.inclk0 ( MAX10_CLK1_50 ),
	.c0 ( c0_sig )
	);

	
cont_1s c1 (
	.mclk(c0_sig), 
	.reset(SW[9]), 
	.SEGUNDO(segundo)
	);


//assign LEDR[9] = segundo;
assign LEDR[8] = segundo;//;////MAX10_CLK1_50;
assign LEDR[9] = SW[9];
	
FSM_Mips fsm1(
	 .Funct(Funct),
	 .op(Op),
	 .clock(segundo),/////sustituto de segundos max10 directo
	 //.z(z),
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
	 .rst(SW[9]),
	 .ALU_reg_write(ALU_reg_write)
	 );
	 
Mips_multi mi1(
	 .clk(segundo), //sustituto de segundo masx10  directo
	 .reset(SW[9]),
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
	 .gpio_o(LEDR[7:0]),
	 .ALU_reg_write(ALU_reg_write),
	 .SW1({24'b0,SW[7:0]}),
	 .SW2({24'b0,SW[7:0]})
	 );

assign GPio = LEDR[7:0];
	 
endmodule 