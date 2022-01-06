module ControlUnit
#(
	parameter 	WIDTH = 32,
	parameter 	IF		= 4'b0000,	//Instruction Fetch
	parameter	ID 	= 4'b0001,	//Instruction Decode
	parameter	EX		= 4'b0010,	//Instruction execution
	parameter	MA 	= 4'b0011,	//Memory Access
	parameter	WB 	= 4'b0100, 	//Writte Back
	parameter	BEQ 	= 4'b0101,	//Branch on equal
	parameter	JMP 	= 4'b0110, 	//Jump Instruction
	parameter	JAL 	= 4'b0111,	//Jal Instruction
	parameter	SW 	= 4'b1000, 	//Store Word 
	parameter	LW 	= 4'b1001	//Load Word	
)
(
	input 		clk, rst,
	input [5:0] Op, Funct,
	
	output reg	InsDat, Mem_W, IR_W, PC_W, Reg_W, PC_Src, Branch, ALU_A,
					Mem_Reg, PCJump, GPIO_o,
	output reg [2:0] 	ALU_Ctrl,
	output reg [1:0] 	ALU_B, Reg_Dst, Zero_Ext
				
);



	reg [3:0] Current;
	reg [3:0] Next;
					
	always @(Current or Op or Funct)
	begin: state_table
	Next 		= 4'b0000;
	PC_W 		= 1'b0;
	Mem_W 	= 1'b0;
	InsDat 	= 1'b0;
	IR_W 		= 1'b0;
	PC_Src 	= 1'b0;
	Branch 	= 1'b0;
	ALU_Ctrl = 3'b000;
	ALU_B 	= 2'b00;
	ALU_A 	= 1'b0;
	Reg_W 	= 1'b0;
	Mem_Reg 	= 1'b0; 
	Reg_Dst 	= 2'b00;
	PCJump 	= 1'b0;
	Zero_Ext = 2'b00;
	GPIO_o 	= 1'b0;
		
		case(Current)
		//Instruction Fetch
			IF: begin
				PC_W 		= 1'b1;
				Mem_W 	= 1'b0;
				InsDat 	= 1'b0;
				IR_W 		= 1'b1;
				PC_Src 	= 1'b0;
				Branch 	= 1'b0;
				ALU_Ctrl = 3'b001;
				ALU_B 	= 2'b01;
				ALU_A 	= 1'b0;
				Reg_W 	= 1'b0;
				Mem_Reg 	= 1'b0; 
				Reg_Dst 	= 2'b00;
				PCJump 	= 1'b1;
				Zero_Ext = 2'b00;
				GPIO_o 	= 1'b0;
				Next = ID;
			end
			
			//Instruction Decode
			ID: begin
				PC_W 		= 1'b0;
				Mem_W 	= 1'b0;
				InsDat 	= 1'b0;
				IR_W 		= 1'b0;
				PC_Src 	= 1'b0;
				Branch 	= 1'b0;
				ALU_Ctrl = 3'b001;
				ALU_B 	= 2'b11;
				ALU_A 	= 1'b0;
				Reg_W 	= 1'b0;
				Mem_Reg 	= 1'b0;
				Reg_Dst 	= 2'b00;
				PCJump 	= 1'b1;
				Zero_Ext = 2'b00;
				GPIO_o 	= 1'b0;
				
				//Branch on equal
				if (Op == 6'h04) 
				begin 
				Next = BEQ;
				end
				
				//Jump Instruction
				else if(Op == 6'h02)
				begin 
				Next = JMP;
				end
				
				//Jump and link Instruction
				else if(Op == 6'h03)
				begin 
				Next = EX;
				end
				
				//Store Word Instruction||//Load Word	Instruction
				else if(Op == 6'h23 || Op == 6'h2b)
				begin 
				Next = MA;				
				end

				else
				begin
				Next = EX;
				end
			end
			
			//Branch on equal
			BEQ: begin
				PC_W 		= 1'b0;
				Mem_W 	= 1'b0;
				InsDat 	= 1'b0;
				IR_W 		= 1'b0;
				PC_Src 	= 1'b1;
				Branch 	= 1'b1;
				ALU_Ctrl = 3'b100;
				ALU_B 	= 2'b00;
				ALU_A 	= 1'b1;
				Reg_W 	= 1'b0;
				Mem_Reg 	= 1'b0;
				Reg_Dst 	= 2'b00;
				PCJump 	= 1'b1;
				GPIO_o 	= 1'b0;
				Next = IF;
			end

			//Jump Instruction
			JMP: begin
				PC_W 		= 1'b1;
				Mem_W 	= 1'b0;
				InsDat 	= 1'b0;
				IR_W 		= 1'b0;
				PC_Src 	= 1'b1;
				Branch 	= 1'b0;
				ALU_Ctrl = 3'b000;
				ALU_B 	= 2'b11;
				ALU_A 	= 1'b0;
				Reg_W 	= 1'b0;
				Mem_Reg 	= 1'b0;
				Reg_Dst 	= 2'b00;
				PCJump 	= 1'b0;
				GPIO_o 	= 1'b0;
				
				//Instruction Fetch
				if (Op == 6'h03)
				begin
				Next = IF;
				end

				else
				begin
				Next = IF;
				end
			end

			//Jump and link Instruction
			JAL: begin
				PC_W 		= 1'b0;
				Mem_W 	= 1'b0;
				InsDat 	= 1'b0;
				IR_W 		= 1'b0;
				PC_Src 	= 1'b0;
				Branch 	= 1'b0;
				ALU_Ctrl = 3'b111;
				ALU_B 	= 2'b01;
				ALU_A 	= 1'b0;
				Reg_W 	= 1'b1; 
				Mem_Reg 	= 1'b0;
				Reg_Dst 	= 2'b10;
				PCJump 	= 1'b1;
				Zero_Ext = 2'b00;
				GPIO_o 	= 1'b0;
				
				Next = JMP;
			end
			
			//Execute Instruction
			EX: begin
				PC_W 		= 1'b0;
				Mem_W 	= 1'b0;
				InsDat 	= 1'b0;
				IR_W 		= 1'b0;
				PC_Src 	= 1'b0;
				Branch 	= 1'b0;
				Reg_W 	= 1'b0;
				PCJump 	= 1'b1;
				GPIO_o 	= 1'b0;
				Next = WB;
				
				
				//Add Instruction
				if(Op == 6'h0 && Funct == 6'h20)
				begin	
					ALU_Ctrl = 3'b001;
					ALU_B 	= 2'b00;
					ALU_A 	= 1'b1;
					Mem_Reg 	= 1'b0;
					Reg_Dst 	= 2'b01;
					Zero_Ext = 2'b00;
					Next = WB;
				end
				
				//ADDI Instruction
				else if (Op == 6'h08)
				begin 
					ALU_Ctrl = 3'b001;
					ALU_B 	= 2'b10;
					ALU_A 	= 1'b1;
					Mem_Reg 	= 1'b0;
					Reg_Dst 	= 2'b00;
					Zero_Ext = 2'b00;
					Next = WB;
				end	
				
				// Li Instruction
				else if (Op == 6'h09)
				begin 
					ALU_Ctrl = 3'b001;
					ALU_B 	= 2'b10;
					ALU_A 	= 1'b1;
					Mem_Reg 	= 1'b0;
					Reg_Dst 	= 2'b00;
					Zero_Ext = 2'b11;
					Next = WB;
				end

				//Ori Instruction
				else if (Op == 6'h0d)
				begin 
					ALU_Ctrl = 3'b011;
					ALU_B 	= 2'b10;
					ALU_A 	= 1'b1;
					Mem_Reg 	= 1'b0;
					Reg_Dst 	= 2'b00;
					Zero_Ext = 2'b01;
					Next = WB;
				end
			
				//Lui Instruction
				else if (Op == 6'h0f)
				begin 
					ALU_Ctrl = 3'b001;
					ALU_B 	= 2'b10;
					ALU_A 	= 1'b1;
					Mem_Reg 	= 1'b0;
					Reg_Dst 	= 2'b00;
					Zero_Ext = 2'b10;
					Next = WB;
				end
				
				//STLI Instruction
				else if (Op == 6'h0a)
				begin 
					ALU_Ctrl = 3'b101;
					ALU_B 	= 2'b10;
					ALU_A 	= 1'b1;
					Mem_Reg 	= 1'b0;
					Reg_Dst 	= 2'b00;
					Zero_Ext = 2'b00;
					Next = WB;
				end
				
				//Jal Instruction
				else if(Op == 6'h03)
				begin 
					ALU_Ctrl = 3'b111;
					ALU_B 	= 2'b10;
					ALU_A 	= 1'b0;
					Mem_Reg 	= 1'b0;
					Reg_Dst 	= 2'b00;
					Zero_Ext = 2'b00;
					Next = JAL;
				end

				//JR Instruction
				else if (Op == 6'h0 && Funct == 6'h08) 
				begin 
					ALU_Ctrl = 3'b111;
					ALU_B 	= 2'b00;
					ALU_A 	= 1'b1;
					Mem_Reg 	= 1'b0;
					Reg_Dst 	= 2'b00;
					Zero_Ext = 2'b01;
					Next = WB;
				end
				
				//Mul Instruction
				else if (Op == 6'h1c)
				begin 
					ALU_Ctrl = 3'b110;
					ALU_B 	= 2'b00;
					ALU_A 	= 1'b1;
					Mem_Reg 	= 1'b0;
					Reg_Dst 	= 2'b01;
					Zero_Ext = 2'b01;
					Next = WB;
				end
				
			end
			
			//Memory Access
			MA: begin
				PC_W 	=	 1'b0;
				Mem_W 	= 1'b0;
				InsDat 	= 1'b1;
				IR_W 		= 1'b0;
				PC_Src 	= 1'b0;
				Branch 	= 1'b0;
				ALU_Ctrl = 3'b001;
				ALU_B 	= 2'b10;
				ALU_A 	= 1'b1;
				Reg_W 	= 1'b0;
				Mem_Reg 	= 1'b0;
				Reg_Dst 	= 2'b00;
				PCJump 	= 1'b0;
				Zero_Ext = 2'b00;
				GPIO_o 	= 1'b0;
				
				//Store Word
				if(Op == 6'h2b)
				begin 
				Next = SW;
				end
				
				//Load Word
				else if(Op == 6'h23)
				begin 
				Next = LW;
				end				

			end

			//Store Word
			SW: begin
				PC_W 		= 1'b0;
				Mem_W 	= 1'b1;
				InsDat 	= 1'b1;
				IR_W 		= 1'b0;
				PC_Src 	= 1'b0;
				Branch 	= 1'b0;
				ALU_Ctrl = 3'b001;
				ALU_B 	= 2'b10;
				ALU_A 	= 1'b1;
				Reg_W 	= 1'b0;
				Mem_Reg 	= 1'b1;
				Reg_Dst 	= 2'b00;
				PCJump 	= 1'b1;
				Zero_Ext = 2'b00;
				GPIO_o 	= 1'b0;
				Next = IF;
			end

			//Load Word
			LW: begin
				PC_W 		= 1'b0;
				Mem_W 	= 1'b0;
				InsDat 	= 1'b1;
				IR_W 		= 1'b0;
				PC_Src 	= 1'b0;
				Branch 	= 1'b0;
				ALU_Ctrl = 3'b001;
				ALU_B 	= 2'b10;
				ALU_A 	= 1'b1;
				Reg_W 	= 1'b0;
				Mem_Reg 	= 1'b1;
				Reg_Dst 	= 2'b00;
				PCJump 	= 1'b1;
				Zero_Ext = 2'b00;
				GPIO_o 	= 1'b0;
				Next = WB;
			end
			
			//Write back
			WB: begin
				PC_W 		= 1'b0;
				Mem_W 	= 1'b0;
				InsDat 	= 1'b0;
				IR_W 		= 1'b0;
				PC_Src 	= 1'b0;
				Branch 	= 1'b0;
				Reg_W 	= 1'b1;
				Mem_Reg 	= 1'b0;
				PCJump 	= 1'b1;
				GPIO_o 	= 1'b0;
				
				// add Instruction
				if(Op == 6'h0 && Funct == 6'h20) 
				begin 
					ALU_Ctrl 	= 3'b001;
					ALU_B 		= 2'b00;
					ALU_A 		= 1'b1;
					Reg_Dst		= 2'b01;
					Zero_Ext 	= 2'b00;
					Next = IF;
				end
				
				// addi Instruction
				else if(Op == 6'h0 ) 
				begin 
					ALU_Ctrl 	= 3'b001;
					ALU_B 		= 2'b10;
					ALU_A 		= 1'b1;
					Reg_Dst		= 2'b00;
					Zero_Ext 	= 2'b00;
					Next = IF;
				end
				
				//ADDIU Instruction
				else if (Op == 6'h09)
				begin 
					ALU_Ctrl 	= 3'b001;
					ALU_B 		= 2'b10;
					ALU_A 		= 1'b1;
					Mem_Reg 		= 1'b0;
					Reg_Dst 		= 2'b00;
					Zero_Ext 	= 2'b11;
					Next = IF;
				end

				//ORI Instruction
				else if (Op == 6'h0d)
				begin 
					ALU_Ctrl = 3'b011;
					ALU_B 	= 2'b10;
					ALU_A 	= 1'b1;
					Reg_Dst 	= 2'b00;
					Zero_Ext = 2'b01;
					Next = IF;
				end
				
				//LUI Instruction
				else if (Op == 6'h0f)
				begin 
					ALU_Ctrl = 3'b001;
					ALU_B 	= 2'b10;
					ALU_A 	= 1'b1;
					Reg_Dst 	= 2'b00;
					Zero_Ext = 2'b10;
					Next = IF;
				end
				
				//ANDI Instruction
				else if (Op == 6'h0c)
				begin 
					ALU_Ctrl = 3'b010;
					ALU_B 	= 2'b10;
					ALU_A 	= 1'b1;
					Reg_Dst 	= 2'b00;
					Zero_Ext = 2'b01;
					Next = IF;
				end
				
				// JR Instruction
				if (Op == 6'h00 && Funct == 6'h08) 
				begin 
					PC_W 		= 1'b1;
					ALU_Ctrl = 3'b111;
					ALU_B 	= 2'b00;
					ALU_A 	= 1'b1;
					Reg_Dst 	= 2'b00;
					Zero_Ext = 2'b01;
					Reg_W		= 1'b0;
					PCJump 	= 1'b1;
					PC_Src	= 1'b1;
					Next = IF;
				end
			
			// JAL Instruction
				if (Op == 6'h03)
				begin 
					ALU_Ctrl = 3'b111;
					ALU_B 	= 2'b11;
					ALU_A 	= 1'b0;
					Reg_Dst 	= 2'b10;
					Zero_Ext = 2'b00;
					Next = IF;
				end

				//STLI Instruction
				else if (Op == 6'h0a)
				begin 
					ALU_Ctrl = 3'b101;
					ALU_B 	= 2'b10;
					ALU_A 	= 1'b1;
					Mem_Reg 	= 1'b0;
					Reg_Dst 	= 2'b00;
					Zero_Ext = 2'b00;
					Next = IF;
				end
				
				//LW Instruction
				else if (Op == 6'h23)
				begin 
					ALU_Ctrl = 3'b001;
					ALU_B 	= 2'b10;
					ALU_A 	= 1'b1;
					Mem_Reg 	= 1'b1;
					Reg_Dst	= 2'b00;	
					Zero_Ext = 2'b00;
					Next = IF;
				end
				
				//MUL Instruction
				else if (Op == 6'h1c)
				begin 
					ALU_Ctrl = 3'b110;
					ALU_B 	= 2'b00;
					ALU_A 	= 1'b1;
					Mem_Reg 	= 1'b0;
					Reg_Dst 	= 2'b01;
					Zero_Ext = 2'b01;
					GPIO_o 	= 1'b1;
					Next = IF;
				end
			end
			
			default: Next = 4'b0000;
		endcase
	end 
	
	always@(posedge clk or negedge rst)
	begin: state_FFs
		if(rst == 0)
			Current <= IF;
		else 
			Current <= Next;
	end 

endmodule
