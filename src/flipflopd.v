module flipflopd
(
	 input data,
    input clk,
	 input rst_n,
	 output reg Q
	 
    );
	 
	/* wire w1, w2, q_n;
	 
	 assign w1 = ~(data & clk);// SET
	 assign w2 = ~(~data & clk);// RESET
	 
	 assign Q = ~(w1 & q_n);//salida Q
	 assign q_n = ~(w2 & Q);*/
	 
	 always @ (negedge rst_n or posedge clk)
begin
	// Reset whenever the reset signal goes low, regardless of the clock
	if (!rst_n)
	begin
		Q <= 1'b0;
	end
	// If not resetting, update the register output on the clock's rising edge
	else
	begin
		Q <= data;
	end
end


endmodule 