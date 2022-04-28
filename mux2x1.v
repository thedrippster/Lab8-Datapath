module mux2x1(i0, i1, s, out);
	
	input [31:0] i0, i1;
	input s;
	
	output reg [31:0] out;
	
	always @ (s or i0 or i1)
		begin case (s)
			0: out <= i0;
			1: out <= i1;
			default: out <= 0;
		endcase
	end	
	
endmodule