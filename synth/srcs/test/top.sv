module top
	(x, z, clk, en_in, en_out, ctrl);
	localparam WIDTH = 8, C = 1, H = 28;

	input clk, en_out, ctrl;
	input en_in[0:C-1][0:H-1];
	input [WIDTH-1:0] x;
	output [WIDTH-1:0] z;

	internal_io #(.WIDTH(WIDTH), .IN(IN), .OUT(OUT)) IO(.x(x), .z(z), .clk(clk), .en_in(en_in), .en_out(en_out), .ctrl(ctrl));
endmodule

module internal_io
	#(parameter WIDTH = 8)
	localparam MID = 10, H = 28, W = 28, C = 1;
	(x, z, clk, en_in, en_out, ctrl);
	input clk, en_out, ctrl;
	input en_in[0:CIN-1][0:H-1];
	input [WIDTH-1:0] x;
	logic [WIDTH-1:0] xx[0:CIN-1][0:H-1][0:W-1];

	logic [WIDTH-1:0] x_conv[0:CIN-1][0:H-1][0:W-1];
	logic [WIDTH-1:0] z_conv[0:COUT-1][0:H-5][0:W-5];
	logic [WIDTH-1:0] z_flatten[0:COUT*(H-4)*(W-4)-1];
	logic [WIDTH-1:0] z_fc[0:OUT-1];
	output [WIDTH-1:0] z;
	
	genvar h,i,j,k;
	generate
		for (h = 0; h < C; h++) begin
			for (i = 0; i < H; i++) begin
				demultiplexer_1d #(.WIDTH(WIDTH), .MAX(W)) demux(.x(x), .clk(clk), .en(en_in[h][i]), .z(xx[h][i]));
			end
		end
	endgenerate
	generate
		for (h = 0; h < CIN; h++) begin
			for (i = 0; i < H; i++) begin
				for (j = 0; j < W; j++) begin
					register_n #(.N(WIDTH)) reg_in(.clk(clk), .reg_e(ctrl), .reg_in(xx[h][i][j]), .reg_out(x_conv[h][i][j]));
				end
			end
		end
	endgenerate

	pack_conv #(.WIDTH(WIDTH), .W(W), .H(H), .CIN(CIN), .COUT(COUT), .F(F)) pack_conv(.x(xx), .z(zz), .clk(clk), .ctrl(ctrl));
	generate
		for (i = 0; i < COUT; i++) begin
			for (j = 0; j < H-4; j++) begin
				for (k = 0; k < W-4; k++) begin
					assign z_flatten[i*(W-4)*(H-4)+j*(W-4)+k] = zz[i][j][k];
				end
			end
		end
	endgenerate
	pack_fc #(.WIDTH(WIDTH)) pack_fc(.x(xx), .z(zz), .clk(clk), .ctrl(ctrl));
	generate
		for (i = 0; i < OUT; i++) begin
			register_n #(.N(WIDTH)) reg_out(.clk(clk), .reg_e(1'b1), .reg_in(zz[i]), .reg_out(z[i]));
		end
	endgenerate

	multiplexer_1d #(.WIDTH(WIDTH*2+$clog2(MID1)), .MAX(OUT)) mux(.x(zz), .clk(clk), .en(en_out), .z(z));

endmodule

module pack_conv
	#(parameter WIDTH = 8)
	(x, z, clk, ctrl);
	localparam W = 28, H = 28, CIN = 1, CMID = 6, COUT = 16, F = 5;

	input clk, ctrl;
	input [WIDTH-1:0] x[0:CIN-1][0:H-1][0:W-1];
	output [WIDTH-1:0] z[0:COUT-1][0:(H-4)/2-1][0:(W-4)/2-1];
	logic [WIDTH*2+$clog2(CIN*F*F)-1:0] z_L1[0:COUT-1][0:H-5][0:W-5];
	logic [WIDTH-1:0] x_L2[0:COUT-1][0:H-5][0:W-5];
	logic [WIDTH-1:0] x_L3[0:COUT-1][0:(H-5)/2][0:(W-5)/2];
	logic [WIDTH*2+$clog2(CIN*F*F)-1:0] z_L3[0:COUT-1][0:(H-4)/2-1][0:(W-4)/2-1];
	logic [WIDTH-1:0] x_L4[0:COUT-1][0:(H-4)/2-1][0:(W-4)/2-1];
	logic [WIDTH-1:0] z_L4[0:COUT-1][0:(H-4)/2-1][0:(W-4)/2-1];

	genvar h, i, j, k;
	conv2d_L1_top #(.WIDTH(WIDTH), .W(28), .H(28), .CIN(1), .COUT(6), .F(F)) conv_l1(.x(x), .z(z_L1));
	maxpool_top #(.WIDTH(WIDTH), .W(24), .H(24), .C(6)) maxpool_L2(.x(x_L2), .z(z_L2));
	conv2d_L3_top #(.WIDTH(WIDTH), .W(12), .H(12), .CIN(6), .COUT(16), .F(F)) conv_L3(.x(x_L3), .z(z_L3));
	maxpool_top #(.WIDTH(WIDTH), .W(8), .H(8), .C(16)) maxpool_L4(.x(x_L4), .z(z_L4));
	assign z = z_L4;

	genvar i,j,k;
	generate
		for (i = 0; i < A; i++) begin
			for (j = 0; j < A; j++) begin
				for (k = 0; k < A; k++) begin
					assign x_L2[i] = z_L1[i][j][k][WIDTH*2+$clog2(CIN*F*F)-1:WIDTH+$clog2(CIN*F*F)+1];
				end
			end
		end
	endgenerate
	generate
		for (i = 0; i < A; i++) begin
			for (j = 0; j < A; j++) begin
				for (k = 0; k < A; k++) begin
					assign x_L4[i] = z_L3[i][j][k][WIDTH*2+$clog2(CIN*F*F)-1:WIDTH+$clog2(CIN*F*F)+1];
				end
			end
		end
	endgenerate

endmodule

module pack_fc
	#(parameter WIDTH = 8)
	(x, z, clk, ctrl);
	localparam IN = 256, OUT = 10, MID1 = 84, MID2 = 84;

	input clk, ctrl;
	input [WIDTH-1:0] x[0:IN-1];
	logic [WIDTH-1:0] xx[0:IN-1];
	//input integer sel0, sel1;
	output [WIDTH-1:0] z[0:OUT-1];
	logic [WIDTH*2+$clog2(MID1)-1:0] z_L5[0:OUT-1];
	logic [WIDTH*2+$clog2(MID1)-1:0] z_L6[0:OUT-1];
	logic [WIDTH*2+$clog2(MID1)-1:0] z_L7[0:OUT-1];
	logic [WIDTH-1:0] x_L6[0:OUT-1];
	logic [WIDTH-1:0] x_L7[0:OUT-1];

	fc256_128 fc_L5(.x(xx), .z(z_L5));
	fc128_84 fc_L6(.x(x_L6), .z(z_L6));
	fc84_10 fc_l7(.x(x_L7), .z(z_L7));
	genvar i;
	generate
		for (i = 0; i < A; i++) begin
			assign x_L6[i] = z_L5[i][WIDTH*2+$clog2(MID1)-1:WIDTH+$clog2(MID1)+1];
		end
	endgenerate
	generate
		for (i = 0; i < A; i++) begin
			assign x_L7[i] = z_L6[i][WIDTH*2+$clog2(MID1)-1:WIDTH+$clog2(MID1)+1];
		end
	endgenerate
	generate
		for (i = 0; i < A; i++) begin
			assign z[i] = z_L7[i][WIDTH*2+$clog2(MID1)-1:WIDTH+$clog2(MID1)+1];
		end
	endgenerate
endmodule
