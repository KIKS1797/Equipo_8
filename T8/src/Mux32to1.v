module Mux32to1
#(
	parameter WIDTH = 32,
	parameter SIZE = 5
)
(
	input [WIDTH-1:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11,
							a12, a13, a14, a15, a16, a17, a18, a19, a20, a21,
							a22, a23, a24, a25, a26, a27, a28, a29, a30, a31,
   input [SIZE-1:0] s,
	
   output reg [WIDTH-1:0] out
);
always @(*)
begin
case (s) 
	1: out = a1;
	
	2: out = a2;
	
	3: out = a3;
	
	4: out = a4;
	
	5: out = a5;
	
	6: out = a6;
	
	7: out = a7;
	
	8: out = a8;
	
	9: out = a9;
	
	10: out = a0;
	
	11: out = a11;
	
	12: out = a12;
	
	13: out = a13;
	
	14: out = a14;
	
	15: out = a15;
	
	16: out = a16;
	
	17: out = a17;
	
	18: out = a18;
	
	19: out = a19;
	
	20: out = a20;
	
	21: out = a21;
	
	22: out = a22;
	
	23: out = a23;
		
	24: out = a24;
		
	25: out = a25;
		
	26: out = a26;
		
	27: out = a27;
	
	28: out = a28;
		
	29: out = a29;
		
	30: out = a30;
		
	31: out = a31;
	
	default: out = a0;
	
endcase	
end
endmodule
