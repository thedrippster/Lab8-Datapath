module ALU(a, b, sel, out, stat);
	
	input [31:0] a, b;
	input [2:0] sel;
	
	output reg [31:0] out;
	output [3:0] stat;
	
	wire cout;
	wire [31:0] sum;
	wire [31:0] dif;
	
	adder m0 (a, b, sum, cout);
	adder m3 ((a+1), (~b), dif, cout);
	
	always @ (*) begin
		case (sel)
			3'b000: out <= sum; //ADD, load, store
			3'b001: out <= a | b; //OR
			3'b010: out <= a << b[4:0]; //SLL
			3'b011: out <= dif; //beq
			default: out = 32'bx;
		endcase
	end
	
	assign stat[3] = ((~a[31]) & (~b[31]) & out[31]) | (a[31] & b[31] & (~out[31])); //v - overflow
	assign stat[2] = (out==0) ? 1 : 0; //z - zero
	assign stat[1] = out[31]; //n - negative
	assign stat[0] = cout; //c - carryout flag
	
endmodule


	
