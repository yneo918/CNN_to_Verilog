`timescale 1ps/1ps
module top
	#(parameter WIDTH = 8, W = 28, H = 28, CIN = 6, COUT = 1, F = 5)
	(x, z, clk, en_in, en_out, ctrl);

	input clk, en_out, ctrl;
	input [WIDTH-1:0] x;
	input en_in[0:CIN-1][0:H-1];
	//output [WIDTH*2+FILTER_SIZE**2:0] z[0:H-(FILTER_SIZE-1)+PADDING*2-1][0:W-(FILTER_SIZE-1)+PADDING*2-1];
	output [WIDTH*2+$clog2(CIN*F*F)-1:0] z;

	internal_io #(.WIDTH(WIDTH), .W(W), .H(H), .CIN(CIN), .COUT(COUT), .F(F)) IO(.x(x), .z(z), .clk(clk), .en_in(en_in), .en_out(en_out), .ctrl(ctrl));
endmodule

module internal_io
	#(parameter WIDTH = 8, W = 28, H = 28, CIN = 6, COUT = 16, F = 5)
	(x, z, clk, en_in, en_out, ctrl);
	input clk, en_out, ctrl;
	input [WIDTH-1:0] x;
	input en_in[0:CIN-1][0:H-1];
	logic [WIDTH-1:0] xx[0:CIN-1][0:H-1][0:W-1];
	logic [WIDTH*2+$clog2(CIN*F*F)-1:0] zz[0:COUT-1][0:H-5][0:W-5];
	logic [WIDTH*2+$clog2(CIN*F*F)-1:0] z_flatten[0:COUT*(H-4)*(W-4)-1];
	output [WIDTH*2+$clog2(CIN*F*F)-1:0] z;
	genvar h,i,j,k;
	generate
		for (h = 0; h < CIN; h++) begin
			for (i = 0; i < H; i++) begin
				demultiplexer_1d #(.WIDTH(WIDTH), .MAX(W)) demux(.x(x), .clk(clk), .en(en_in[h][i]), .z(xx[h][i]));
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
	multiplexer_1d #(.WIDTH(WIDTH*2+$clog2(CIN*F*F)), .MAX(COUT*(W-4)*(H-4))) mux(.x(z_flatten), .clk(clk), .en(en_out), .z(z));

endmodule

module pack_conv
	#(parameter WIDTH = 8, W = 28, H = 28, CIN = 6, COUT = 16, F = 5)
	(x, z, clk, ctrl);

	input clk, ctrl;
	input [WIDTH-1:0] x[0:CIN-1][0:H-1][0:W-1];
	logic [WIDTH-1:0] xx[0:CIN-1][0:H-1][0:W-1];
	//input integer sel0, sel1;
	output [WIDTH*2+$clog2(CIN*F*F)-1:0] z[0:COUT-1][0:H-5][0:W-5];
	logic [WIDTH*2+$clog2(CIN*F*F)-1:0] zz[0:COUT-1][0:H-5][0:W-5];

	conv2d_top #(.WIDTH(WIDTH), .W(W), .H(H), .CIN(CIN), .COUT(COUT), .F(F)) conv_top(.x(xx), .z(zz));

	genvar h, i, j, k;
	generate
		for (h = 0; h < CIN; h++) begin
			for (i = 0; i < H; i++) begin
				for (j = 0; j < W; j++) begin
					register_n #(.N(WIDTH)) reg_in(.clk(clk), .reg_e(ctrl), .reg_in(x[h][i][j]), .reg_out(xx[h][i][j]));
				end
			end
		end
	endgenerate
	generate
		for (i = 0; i < COUT; i++) begin
			for (j = 0; j < H-4; j++) begin
				for (k = 0; k < W-4; k++) begin
					register_n #(.N(WIDTH*2+$clog2(CIN*F*F))) reg_out(.clk(clk), .reg_e(1'b1), .reg_in(zz[i][j][k]), .reg_out(z[i][j][k]));
				end
			end
		end
	endgenerate

endmodule
