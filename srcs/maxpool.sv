module maxpool_top
	#(parameter WIDTH = 8, W = 24, H = 24, C = 6)
	(x, z);
	input [WIDTH-1:0] x[0:C-1][0:H-1][0:W-1];
	output [WIDTH-1:0] z[0:C-1][0:H/2-1][0:W/2-1];
	genvar h, i, j;
	generate
		for (h = 0; h < C; h++) begin
			for (i = 0; i < H/2-1; i++) begin
				for (j = 0; j < W/2-1; j++) begin
					maxpool #(.WIDTH(WIDTH)) maxpool(.x('{x[h][i*2][j*2], x[h][i*2+1][j*2], x[h][i*2][j*2+1], x[h][i*2+1][j*2+1]}), .z(z[h][i][j]));
				end
			end
		end
	endgenerate
endmodule


module maxpool
	#(parameter WIDTH = 8)
	(x, z);
	input [WIDTH-1:0] x[0:3];
	output [WIDTH-1:0] z;
	wire [WIDTH-1:0] v0, v1, v2, y0, y1;
	wire c0, c1, c2;

	assign v0 = x[0] - x[1];
	assign v1 = x[2] - x[3];
	assign v2 = v0 - v1;
	assign c0 = x[0][WIDTH-1] & ~x[1][WIDTH-1] | (x[0][WIDTH-1] ^ x[1][WIDTH-1]) & v0[WIDTH-1];
	assign c1 = x[2][WIDTH-1] & ~x[3][WIDTH-1] | (x[2][WIDTH-1] ^ x[3][WIDTH-1]) & v1[WIDTH-1];
	assign c2 = v0[WIDTH-1] & ~v1[WIDTH-1] | (v0[WIDTH-1] ^ v1[WIDTH-1]) & v2[WIDTH-1];

	mux2 #(.WIDTH(WIDTH)) mux00(.a(x[0]), .b(x[1]), .sel(c0), .out(y0));
	mux2 #(.WIDTH(WIDTH)) mux01(.a(x[2]), .b(x[3]), .sel(c1), .out(y1));
	mux2 #(.WIDTH(WIDTH)) mux02(.a(v0), .b(v1), .sel(c2), .out(z));
endmodule