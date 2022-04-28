module ID (inst, rd, rs1, rs2, out);
	
	input [31:0] inst;
	
	output [4:0] rd, rs1, rs2;
	output [31:0] out;
	
	assign rd = inst[11:7];
	assign rs1 = inst[19:15];
	assign rs2 = inst[24:20];
	
	assign out = inst;
	
	
endmodule
