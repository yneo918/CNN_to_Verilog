module pack_fc
	#(parameter WIDTH = 8)
	(x, z, clk, ctrl);

	input clk, ctrl;
	input [WIDTH-1:0] x[0:256-1];
	//input integer sel0, sel1;
	output [WIDTH-1:0] z[0:10-1];
	logic [WIDTH-1:0] x_L5[0:256-1];
	logic [WIDTH*2+$clog2(256)-1:0] z_L5[0:128-1];
	logic [WIDTH-1:0] x_L6[0:128-1];
	logic [WIDTH*2+$clog2(128)-1:0] z_L6[0:84-1];
	logic [WIDTH-1:0] x_L7[0:84-1];
	logic [WIDTH*2+$clog2(84)-1:0] z_L7[0:10-1];

	assign x_L5 = x;
	genvar i;
	fc256_128 fc_L5(.x(x_L5), .z(z_L5));
	generate
		for (i = 0; i < 128; i++) begin
			assign x_L6[i] = z_L5[i][WIDTH*2+$clog2(256)-1:WIDTH+$clog2(256)+1];
		end
	endgenerate
	fc128_84 fc_L6(.x(x_L6), .z(z_L6));
	generate
		for (i = 0; i < 84; i++) begin
			assign x_L7[i] = z_L6[i][WIDTH*2+$clog2(128)-1:WIDTH+$clog2(128)+1];
		end
	endgenerate
	fc84_10 fc_L7(.x(x_L7), .z(z_L7));
	generate
		for (i = 0; i < 10; i++) begin
			assign z[i] = z_L7[i][WIDTH*2+$clog2(84)-1:WIDTH+$clog2(84)+1];
		end
	endgenerate
endmodule
