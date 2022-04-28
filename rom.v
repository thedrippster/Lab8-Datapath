module rom (addr, out);
	input [7:0] addr;
	output reg [31:0] out;
	
	always @ (addr) begin
		case (addr)
			8'h00: out = 32'h00a00293; //addi x5, x0, 10
			8'h04: out = 32'h00f00313; //addi x6, x0, 15
			8'h08: out = 32'h01400393; //addi x7, x0, 20
			8'h0c: out = 32'h00628863; //beq x5, x6, 14
			8'h10: out = 32'h00736433; //or x8, x6, x7
			8'h14: out = 32'h00129293; //slli x5, x5, 1
			8'h18: out = 32'h00602223; //sw x6, 4(x0)
			8'h1c: out = 32'h00402483; //lw x9, 4(x0)
			8'h20: out = 32'h00728863; //beq x5, x7, 28
			8'h24: out = 32'h00648533; //add x10, x9, x6
			8'h28: out = 32'hffb30493; //addi x9, x6, -5
			8'h2c: out = 32'h00a02423; //sw x10, 8(x0)
			default: out = 32'b0;
		endcase
	end
	
endmodule
