module pack_conv
	#(parameter WIDTH = 8)
	(x, z, clk, ctrl);

	input clk, ctrl;
	input [WIDTH-1:0] x[0:1-1][0:28-1][0:28-1];
	output [WIDTH-1:0] z[0:16-1][0:4-1][0:4-1];
	logic [WIDTH-1:0] x_L1[0:1-1][0:28-1][0:28-1];
	logic [WIDTH*2+$clog2(1*5*5)-1:0] z_L1[0:6-1][0:24-1][0:24-1];
	logic [WIDTH-1:0] x_L2[0:6-1][0:24-1][0:24-1];
	logic [WIDTH-1:0] z_L2[0:6-1][0:12-1][0:12-1];
	logic [WIDTH-1:0] x_L3[0:6-1][0:12-1][0:12-1];
	logic [WIDTH*2+$clog2(6*5*5)-1:0] z_L3[0:16-1][0:8-1][0:8-1];
	logic [WIDTH-1:0] x_L4[0:16-1][0:8-1][0:8-1];
	logic [WIDTH-1:0] z_L4[0:16-1][0:4-1][0:4-1];

	genvar i,j,k;
	assign x_L1 = x;
	conv2d_L1_top #(.WIDTH(WIDTH)) conv_l1(.x(x_L1), .z(z_L1));
	generate
		for (i = 0; i < 6; i++) begin
			for (j = 0; j < 24; j++) begin
				for (k = 0; k < 24; k++) begin
					assign x_L2[i][j][k] = z_L1[i][j][k][WIDTH*2+$clog2(25)-1:WIDTH+$clog2(25)+1];
				end
			end
		end
	endgenerate
	maxpool_top #(.WIDTH(WIDTH), .W(24), .H(24), .C(6)) maxpool_L2(.x(x_L2), .z(z_L2));
	conv2d_L3_top #(.WIDTH(WIDTH)) conv_l3(.x(x_L3), .z(z_L3));
	generate
		for (i = 0; i < 16; i++) begin
			for (j = 0; j < 8; j++) begin
				for (k = 0; k < 8; k++) begin
					assign x_L4[i][j][k] = z_L3[i][j][k][WIDTH*2+$clog2(150)-1:WIDTH+$clog2(150)+1];
				end
			end
		end
	endgenerate
	maxpool_top #(.WIDTH(WIDTH), .W(8), .H(8), .C(16)) maxpool_L4(.x(x_L4), .z(z_L4));
	assign z = z_L4;

endmodule

