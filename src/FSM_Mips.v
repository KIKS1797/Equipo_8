module FSM_Mips(
	input clock,
	input [5:0] Funct, op,
	input rst,
	output reg [3:0] z,
	output reg PC_write, // pc register enable
	output reg Mem_write, //enable for ram memory
	output reg lorD_mux, //first mux addr
	output reg IR_write, // second register for operation 
	output reg Reg_Dst_mux,
	output reg Mem_reg_mux,
	output reg Reg_write,
	output reg ALU_srcA_mux,
	output reg [1:0] ALU_srcB_mux,
	output reg [2:0] ALU_control,
	output reg Pc_src_mux,
	output reg Branch
	);

	reg [5:0] sec;
parameter 		A = 6'b001000,
			B = 6'b000000;
			 
			/* C = 6'b000010_,
			 D = 6'b001100_,
			 E = 6'b010000_,
			 F = 6'b010100_,
			 G = 6'b011000_,
			 H = 6'b011100_,
			 I = 6'b100000_;*/
			 

always@(posedge clock, negedge rst)
	begin
		if (!rst) begin
	sec = 6'b000000;
	lorD_mux = 0;
   Mem_write = 0;
	IR_write = 1;

	Reg_Dst_mux = 0;
	Mem_reg_mux = 0;

	PC_write = 1'b0;
	Branch = 0;
	Pc_src_mux = 0;
	ALU_control = 010;
	ALU_srcA_mux = 1;
	ALU_srcB_mux = 10;
	Reg_write = 0;
end
else begin
		case (op)
			A: if (sec == 0) begin 
			$display("entro el primer estado %t",$time);
										IR_write = 1;
										sec = sec + 1;
								  end
				else if (sec == 1) begin 
										
										IR_write = 0;
										sec = sec + 1;
								  end
				else if (sec == 2) begin 
										
										ALU_srcA_mux = 1;
										ALU_srcB_mux = 10;	
										sec = sec + 1;
								  end
				else if (sec == 3) begin 
										Reg_write = 1;
										sec = sec + 1;
								  end
				else if (sec == 4) begin 
										Reg_write = 0;
										sec = sec + 1;
								  end
				else if (sec == 5) begin 
										ALU_srcA_mux = 0;
										ALU_srcB_mux = 01;
										sec = sec + 1;
								  end
				else if (sec == 6) begin 
										PC_write = 1;
										sec = sec + 1;
								  end
				else if (sec == 7) begin 
										PC_write = 0;	
										sec = sec + 1;
								end
				else if (sec == 8) begin 
										IR_write = 1;
										sec = sec + 1;
								end
				else if (sec == 9) begin 
										IR_write = 0;
										sec = 0;
								  end
				else sec = 0;
				
			B: if (sec == 0 && Funct == 6'b100000) begin //B es add y su OP es comun
			$display("entro el segundo estado");			
										IR_write = 1;
										sec = sec + 1;
								  end
				else if (sec == 1) begin 
										IR_write = 0;
										sec = sec + 1;
								end
				else if (sec == 2) begin 
										ALU_srcA_mux = 1;
										ALU_srcB_mux = 00;
										sec = sec + 1;
								  end	  
				else if (sec == 3) begin 
										Reg_Dst_mux = 1;
										sec = sec + 1;
								  end
				else if (sec == 4) begin 
										Reg_write = 1;
										sec = sec + 1;
								  end
				else if (sec == 5) begin 
										Reg_write = 0;
										sec = sec + 1;
								  end
				else if (sec == 6) begin 
										ALU_srcA_mux = 0;
										ALU_srcB_mux = 01;
										sec = sec + 1;
								  end
				else if (sec == 7) begin 
										PC_write = 1;
										sec = sec + 1;
								  end
				else if (sec == 8) begin 
										PC_write = 0;
										sec = 0;
								  end
				else if (sec == 9) begin 
										IR_write = 1;
										sec = sec + 1;
								end
				else if (sec == 10) begin 
										IR_write = 0;
										sec = 0;
								  end
				else sec = 0;
				
			//default: next = A;
		endcase
		end
end //se termina la tabla de estados
/*always@(negedge rst)
	begin
	sec = 6'b000000;
	lorD_mux = 0;
   Mem_write = 0;
	IR_write = 1;

	Reg_Dst_mux = 0;
	Mem_reg_mux = 0;

	PC_write = 1'b0;
	Branch = 0;
	Pc_src_mux = 0;
	ALU_control = 010;
	ALU_srcA_mux = 1;
	ALU_srcB_mux = 10;
	Reg_write = 0;
end
/*always@(posedge clock)
begin
	if (!rst) state = A;
	else begin
		state = next;
		st = state;
		end
end // fin de states FFs*/


endmodule
