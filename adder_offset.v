module adder_offset (in, offset, out);

	input [31:0] in, offset;
	
	output signed [31:0] out;
	
	wire [32:0] temp;
	assign temp = {1'b0, in} + {1'b0, offset};
	
	assign out = temp[31:0];
	
endmodule

