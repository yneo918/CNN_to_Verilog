module top
	#(parameter WIDTH = 8)
	(x, z, clk, ctrl, en);

	input clk, ctrl;
	input en;
	input [WIDTH-1:0] x;
	logic [WIDTH-1:0] x_demux[0:84-1];
	output [WIDTH*2+$clog2(58)-1:0] z;
	logic [WIDTH-1:0] x_reg[0:84-1];
	logic [WIDTH*2+$clog2(58)-1:0] z_reg;

	genvar i;
	layer #(.WIDTH(WIDTH)) conv(.x(x_reg), .z(z_reg));
	demultiplexer_1d #(.WIDTH(WIDTH), .MAX(84)) demux(.x(x), .clk(clk), .en(en), .z(x_demux));
	generate
		for (i = 0; i < 84; i++) begin
			register_n #(.N(WIDTH)) reg_in(.clk(clk), .reg_e(ctrl), .reg_in(x_demux[i]), .reg_out(x_reg[i]));
		end
	endgenerate
	register_n #(.N(WIDTH*2+$clog2(58))) reg_out(.clk(clk), .reg_e(ctrl), .reg_in(z_reg), .reg_out(z));

endmodule
