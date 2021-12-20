module One_register
(
	input clk,
	input rst,
	input enable,
	input [31:0] data,
	
	output reg [31:0] one_register_o
);
	
always @ (negedge rst or posedge clk)
begin
	// Reset whenever the reset signal goes low, regardless of the clock
	//$display("data in one register %d", data);
	// or the clock enable
	if (!rst)
	begin
		one_register_o <= 32'h0040_0000;
	end
	// If not resetting, and the clock signal is enabled on this register,
	// update the register output on the clock's rising edge
	else
	begin
		if (enable)//enable
		begin
			one_register_o <= data;
			//$display("Register output, this goes to op, and func %d", one_register_o);
			
		end
	end
end
endmodule 