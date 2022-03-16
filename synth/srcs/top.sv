module top
	(x, z, clk, en_in, en_out, ctrl);
	localparam WIDTH = 8;

	input clk, en_out, ctrl;
	input en_in[0:3-1][0:32-1];
	input [WIDTH-1:0] x;
	output [WIDTH-1:0] z;

	internal_io #(.WIDTH(WIDTH)) IO(.x(x), .z(z), .clk(clk), .en_in(en_in), .en_out(en_out), .ctrl(ctrl));
endmodule

module internal_io
	#(parameter WIDTH = 8)
	(x, z, clk, en_in, en_out, ctrl);
	localparam H = 28, W = 28;
	input clk, en_out, ctrl;
	input en_in[0:3-1][0:32-1];
	input [WIDTH-1:0] x;
	logic [WIDTH-1:0] xx[0:3-1][0:32-1][0:32-1];

	logic [WIDTH-1:0] x_conv[0:3-1][0:32-1][0:32-1];
	logic [WIDTH-1:0] z_conv[0:6-1][0:14-1][0:14-1];
	logic [WIDTH-1:0] z_flatten[0:6*14*14-1];
	logic [WIDTH-1:0] z_reg[0:6*14*14-1];
	output [WIDTH-1:0] z;
	
	genvar h,i,j,k;
	generate
		for (h = 0; h < 3; h++) begin
			for (i = 0; i < 32; i++) begin
				demultiplexer_1d #(.WIDTH(WIDTH), .MAX(32)) demux(.x(x), .clk(clk), .en(en_in[h][i]), .z(xx[h][i]));
			end
		end
	endgenerate
	generate
		for (h = 0; h < 3; h++) begin
			for (i = 0; i < 32; i++) begin
				for (j = 0; j < 32; j++) begin
					register_n #(.N(WIDTH)) reg_in(.clk(clk), .reg_e(ctrl), .reg_in(xx[h][i][j]), .reg_out(x_conv[h][i][j]));
				end
			end
		end
	endgenerate

	pack_conv #(.WIDTH(WIDTH)) pack_conv(.x(xx), .z(z_conv), .clk(clk), .ctrl(ctrl));
	generate
		for (i = 0; i < 6; i++) begin
			for (j = 0; j < 14-1; j++) begin
				for (k = 0; k < 14-1; k++) begin
					assign z_flatten[i*14*14+j*14+k] = z_conv[i][j][k];
				end
			end
		end
	endgenerate
	generate
		for (i = 0; i < 1176; i++) begin
			register_n #(.N(WIDTH)) reg_out(.clk(clk), .reg_e(1'b1), .reg_in(z_flatten[i]), .reg_out(z_reg[i]));
		end
	endgenerate

	multiplexer_1d #(.WIDTH(WIDTH), .MAX(1176)) mux(.x(z_reg), .clk(clk), .en(en_out), .z(z));

endmodule

