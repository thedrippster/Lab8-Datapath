module regFile_32x32(clk, rst, Din, writeEn, read1Add, read2Add, writeAdd, Dout1, Dout2);
	input clk, rst, writeEn;
	input [31:0] Din;
	input [4:0] read1Add, read2Add, writeAdd;
	output [31:0] Dout1, Dout2;
	
	wire [31:0] dec_out;
	
	decoder5x32 u0 (writeAdd, writeEn, dec_out);
	
	wire [31:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, 
					x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, 
					x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, 
					x30, x31;
	
	Register_32bit u1 (Din, dec_out[0], clk, rst, x0);
	Register_32bit u2 (Din, dec_out[1], clk, rst, x1);
	Register_32bit u3 (Din, dec_out[2], clk, rst, x2);
	Register_32bit u4 (Din, dec_out[3], clk, rst, x3);
	Register_32bit u5 (Din, dec_out[4], clk, rst, x4);
	Register_32bit u6 (Din, dec_out[5], clk, rst, x5);
	Register_32bit u7 (Din, dec_out[6], clk, rst, x6);
	Register_32bit u8 (Din, dec_out[7], clk, rst, x7);
	Register_32bit u9 (Din, dec_out[8], clk, rst, x8);
	Register_32bit u10 (Din, dec_out[9], clk, rst, x9);
	Register_32bit u11 (Din, dec_out[10], clk, rst, x10);
	Register_32bit u12 (Din, dec_out[11], clk, rst, x11);
	Register_32bit u13 (Din, dec_out[12], clk, rst, x12);
	Register_32bit u14 (Din, dec_out[13], clk, rst, x13);
	Register_32bit u15 (Din, dec_out[14], clk, rst, x14);
	Register_32bit u16 (Din, dec_out[15], clk, rst, x15);
	Register_32bit u17 (Din, dec_out[16], clk, rst, x16);
	Register_32bit u18 (Din, dec_out[17], clk, rst, x17);
	Register_32bit u19 (Din, dec_out[18], clk, rst, x18);
	Register_32bit u20 (Din, dec_out[19], clk, rst, x19);
	Register_32bit u21 (Din, dec_out[20], clk, rst, x20);
	Register_32bit u22 (Din, dec_out[21], clk, rst, x21);
	Register_32bit u23 (Din, dec_out[22], clk, rst, x22);
	Register_32bit u24 (Din, dec_out[23], clk, rst, x23);
	Register_32bit u25 (Din, dec_out[24], clk, rst, x24);
	Register_32bit u26 (Din, dec_out[25], clk, rst, x25);
	Register_32bit u27 (Din, dec_out[26], clk, rst, x26);
	Register_32bit u28 (Din, dec_out[27], clk, rst, x27);
	Register_32bit u29 (Din, dec_out[28], clk, rst, x28);
	Register_32bit u30 (Din, dec_out[29], clk, rst, x29);
	Register_32bit u31 (Din, dec_out[30], clk, rst, x30);
	Register_32bit u32 (Din, dec_out[31], clk, rst, x31);
	
	Mux_32x1 u33 (x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, 
				x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, 
				x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, 
				x30, x31, read1Add, Dout1);
	Mux_32x1 u34 (x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, 
				x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, 
				x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, 
				x30, x31, read2Add, Dout2);
	
endmodule
	
	