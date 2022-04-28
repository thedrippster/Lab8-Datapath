module Datapath (clk, rst, PCsrc, ALUsrc, MemRW, WB, RegRW, immSel, ALUop, status, inst, finalOut);

	input clk, rst, PCsrc, ALUsrc, MemRW, WB, RegRW;
	input [1:0] immSel;
	input [2:0] ALUop;
	
	output [3:0] status;
	output [31:0] inst, finalOut;
	
	wire [31:0] PCin, PCout, add4out, offset, addOffOut, ROMout, immOut, data1, data2, ALUin2, ALUout, RAMout;
	wire [4:0] rd, rs1, rs2;
	wire offsetCarry;
	
	
	PC d0 (PCin, clk, rst, PCout);
	adder_4 d1 (PCout, add4out);
	adder d2 (PCout, offset, addOffOut, offsetCarry);
	mux2x1 d3 (add4out, addOffOut, PCsrc, PCin);
	
	rom d4 (PCout, ROMout);
	
	ID d5 (ROMout, rd, rs1, rs2, inst);
	
	imm_gen d6 (inst, immSel, immOut);
	
	regFile_32x32 d7 (clk, rst, finalOut, RegRW, rs1, rs2, rd, data1, data2);
	
	mux2x1 d8 (data2, immOut, ALUsrc, ALUin2);
	
	ALU d9 (data1, ALUin2, ALUop, ALUout, status);
	
	RAM_256x32 d10 (data2, ALUout[7:0], MemRW, clk, RAMout);
	mux2x1 d11 (RAMout, ALUout, WB, finalOut);
	
endmodule
	
	