 module FlipFlop #(parameter WIDTH = 32)
(
	input			[WIDTH-1:0] D, 
	input 		clk,
	input			reset,
	input 		enable,
	
	output		[WIDTH-1:0] Q
);

	reg [WIDTH-1:0] data;
	always @(posedge clk or negedge reset) 
	begin
      if (!reset)
         data <= 0;
      else
			if(enable)
         data <= D;
   end 
	assign Q = data;	
endmodule  module FF

(
	input			[WIDTH-1:0] D, 
	input 		clk,
	input			reset,
	input 		enable,
	output		[WIDTH-1:0] Q
);
	reg [WIDTH-1:0] data;
	always @(posedge clk or negedge reset) 
	begin
      if (!reset)
         data <= 0;
      else
			if(enable)
         data <= D;
   end 
	assign Q = data;	
endmodule 