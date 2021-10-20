module register_n
	#(parameter N = 26)
	(clk, reg_e, reg_in, reg_out);
	input 	clk, reg_e;
	input	[N-1:0] reg_in;
	output	[N-1:0] reg_out;
	reg	[N-1:0] reg_out;
	
	always @(posedge clk) begin
		if (reg_e == 1'b1)
			reg_out	<= reg_in;
	end
endmodule

module demultiplexer_1d
	#(parameter WIDTH = 8, MAX = 16)
	(x, clk, en, z);
	input [WIDTH-1:0] x;
	input clk, en;
	int sel = 0;
	output logic [WIDTH-1:0] z[0:MAX-1];

	always @(posedge clk) begin
		if (en == 1'b1)
			sel <= (sel+1)%(MAX+1);
		else
			sel <= MAX;
	end

	genvar i;
	generate
		for (i = 0; i < MAX; i++) begin
			always @(posedge clk) begin
				if(sel == i)
					z[i] <= x;
			end
		end
	endgenerate
endmodule

module multiplexer_1d
	#(parameter WIDTH = 8, MAX = 16)
	(x, clk, en, z);
	input [WIDTH-1:0] x[0:MAX-1];
	input clk, en;
	int sel = 0;
	output logic [WIDTH-1:0] z;

	always @(posedge clk) begin
		if (en == 1'b1)
			sel <= (sel+1)%MAX;
		else
			sel <= 0;
	end
	always @(posedge clk) begin
		z <= x[sel];
	end
endmodule

module relu
	#(parameter WIDTH = 8)
	(a,b,sel,out);
	input [WIDTH-1:0] a,b;
	input sel;
	output logic [WIDTH-1:0] out;
	always @* begin
		if(sel == 1'b0)
			out <= a;
		else
			out <= b;
	end
endmodule

module mult
	#(parameter I_WIDTH = 8, O_WIDTH = 16)
	(in0, in1, out);
	input [I_WIDTH-1:0] in0, in1;
	output [O_WIDTH-1:0] out;
	assign out = $signed(in0) * $signed(in1);
endmodule

module add2
	#(parameter I_WIDTH = 8, O_WIDTH = 9)
	(in0, in1, out);
	input [I_WIDTH-1:0] in0, in1;
	output [O_WIDTH-1:0] out;
	assign out = $signed(in0) + $signed(in1);
endmodule


module mux2
	#(parameter WIDTH = 8)
	(a,b,sel,out);
	input [WIDTH-1:0] a,b;
	input sel;
	output [WIDTH-1:0] out;
	genvar i;
	generate
		for (i = 0; i < WIDTH; i++) begin
			assign out[i] = sel & a[i] | ~sel & b[i];
		end
	endgenerate
endmodule