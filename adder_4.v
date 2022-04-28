module adder_4 (in, out);

	input [31:0] in;
	
	output [31:0] out;
	
	assign out = in +8'd4;
	
endmodule
