module RAM_256x32(in, addr, wr, clk, out);
	
	input [31:0] in;
	input [7:0] addr;
	input wr, clk;
		
	output [31:0] out;
	
	wire [3:0] cs;
	wire [31:0] D0, D1, D2, D3;
	
	decoder_2x4 d0 (addr[7:6], cs);
	
	smallRam r0 (addr[5:0], wr, clk, cs[0], in[7:0], D0[7:0]);
	smallRam r1 (addr[5:0], wr, clk, cs[0], in[15:8], D0[15:8]);
	smallRam r2 (addr[5:0], wr, clk, cs[0], in[23:16], D0[23:16]);
	smallRam r3 (addr[5:0], wr, clk, cs[0], in[31:24], D0[31:24]);
	
	smallRam r4 (addr[5:0], wr, clk, cs[1], in[7:0], D1[7:0]);
	smallRam r5 (addr[5:0], wr, clk, cs[1], in[15:8], D1[15:8]);
	smallRam r6 (addr[5:0], wr, clk, cs[1], in[23:16], D1[23:16]);
	smallRam r7 (addr[5:0], wr, clk, cs[1], in[31:24], D1[31:24]);

	smallRam r8 (addr[5:0], wr, clk, cs[2], in[7:0], D2[7:0]);
	smallRam r9 (addr[5:0], wr, clk, cs[2], in[15:8], D2[15:8]);
	smallRam r10 (addr[5:0], wr, clk, cs[2], in[23:16], D2[23:16]);
	smallRam r11 (addr[5:0], wr, clk, cs[2], in[31:24], D2[31:24]);
	
	smallRam r12 (addr[5:0], wr, clk, cs[3], in[7:0], D3[7:0]);
	smallRam r13 (addr[5:0], wr, clk, cs[3], in[15:8], D3[15:8]);
	smallRam r14 (addr[5:0], wr, clk, cs[3], in[23:16], D3[23:16]);
	smallRam r15 (addr[5:0], wr, clk, cs[3], in[31:24], D3[31:24]);
	
	TriStateBuff t0 (D0, cs[0], out);
	TriStateBuff t1 (D1, cs[1], out);
	TriStateBuff t2 (D2, cs[2], out);
	TriStateBuff t3 (D3, cs[3], out);
	
endmodule
