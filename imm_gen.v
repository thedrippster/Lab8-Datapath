module imm_gen (in, sel, out);
	
	input [31:0] in;
	input [1:0] sel;
	
	output reg [31:0] out;
	
	always @ (in or sel) begin
		case (sel)
			2'b00: out [31:0] = {32'b0}; //R-type
			2'b01: out [31:0] = {{20{in[31]}}, {in [31:20]}}; //I-type
			2'b10: out [31:0] = {{20{in[31]}}, {in[31:25]}, {in[11:7]}}; //S-type
			2'b11: out [31:0] = {{20{in[31]}}, in[31], in[7], {in[30:25]}, {in[11:8]}}; //B-type
			default: out = 32'bx;
		endcase
	end
	
endmodule
