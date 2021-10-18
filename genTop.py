#!/usr/bin/env python3.6.9

import math
import sys
import joblib
import config
import copy

def generate_top(config):
	# self.width, self.layer, self.input_shape, self.classes, self.act
	input_layer = config.layer[0][0]
	O_FILE_NAME = "top.sv"
	OUTPUT_FILE = open("./srcs/"+O_FILE_NAME,"w")
	OUTPUT_FILE.write("module top\n")
	OUTPUT_FILE.write("	(x, z, clk, en_in, en_out, ctrl);\n")
	OUTPUT_FILE.write("	localparam WIDTH = 8;\n")
	OUTPUT_FILE.write("\n")
	OUTPUT_FILE.write("	input clk, en_out, ctrl;\n")
	if input_layer == "conv":
		OUTPUT_FILE.write("	input en_in[0:"+str(config.input_shape[0])+"-1][0:"+str(config.input_shape[1])+"-1];\n")
	elif input_layer == "fc":
		OUTPUT_FILE.write("	input en_in;\n")
	OUTPUT_FILE.write("	input [WIDTH-1:0] x;\n")
	OUTPUT_FILE.write("	output [WIDTH-1:0] z;\n")
	OUTPUT_FILE.write("\n")
	OUTPUT_FILE.write("	internal_io #(.WIDTH(WIDTH)) IO(.x(x), .z(z), .clk(clk), .en_in(en_in), .en_out(en_out), .ctrl(ctrl));\n")
	OUTPUT_FILE.write("endmodule\n")
	OUTPUT_FILE.write("\n")

	OUTPUT_FILE.write("module internal_io\n")
	OUTPUT_FILE.write("	#(parameter WIDTH = 8)\n")
	OUTPUT_FILE.write("	(x, z, clk, en_in, en_out, ctrl);\n")
	OUTPUT_FILE.write("	localparam H = 28, W = 28;\n")
	OUTPUT_FILE.write("	input clk, en_out, ctrl;\n")
	if input_layer == "conv":
		OUTPUT_FILE.write("	input en_in[0:"+str(config.input_shape[0])+"-1][0:"+str(config.input_shape[1])+"-1];\n")
	elif input_layer == "fc":
		OUTPUT_FILE.write("	input en_in;\n")
	OUTPUT_FILE.write("	input [WIDTH-1:0] x;\n")
	if input_layer == "conv":
		OUTPUT_FILE.write("	logic [WIDTH-1:0] xx[0:"+str(config.input_shape[0])+"-1][0:"+str(config.input_shape[2])+"-1][0:"+str(config.input_shape[1])+"-1];\n")
	elif input_layer == "fc":
		OUTPUT_FILE.write("	logic [WIDTH-1:0] xx[0:"+str(config.input_shape[0])+"-1];\n")
	OUTPUT_FILE.write("\n")
	if config.conv:
		shape = copy.deepcopy(config.input_shape)
		for L in config.layer:
			if L[0] == "conv":
				shape[0] = L[2]
				shape[1] = shape[1] - (L[3] - 1)
				shape[2] = shape[2] - (L[3] - 1)
			if L[0] == "maxpool":
				shape[1] = shape[1] // 2
				shape[2] = shape[2] // 2
			if L[0] == "fc":
				break;
		OUTPUT_FILE.write("	logic [WIDTH-1:0] x_conv[0:"+str(config.input_shape[0])+"-1][0:"+str(config.input_shape[2])+"-1][0:"+str(config.input_shape[1])+"-1];\n")
		OUTPUT_FILE.write("	logic [WIDTH-1:0] z_conv[0:"+str(shape[0])+"-1][0:"+str(shape[2])+"-1][0:"+str(shape[1])+"-1];\n")
		OUTPUT_FILE.write("	logic [WIDTH-1:0] z_flatten[0:"+str(shape[0])+"*"+str(shape[2])+"*"+str(shape[1])+"-1];\n")
		if not config.fc:
			OUTPUT_FILE.write("	output [WIDTH-1:0] z_reg[0:"+str(shape[0])+"*"+str(shape[2])+"*"+str(shape[1])+"-1];\n")
	if config.fc:
		if config.conv:
			OUTPUT_FILE.write("	logic [WIDTH-1:0] x_fc[0:"+str(shape[0])+"*"+str(shape[2])+"*"+str(shape[1])+"-1];\n")
		else:
			OUTPUT_FILE.write("	logic [WIDTH-1:0] x_fc[0:"+str(config.input_shape[0])+"-1];\n")
		OUTPUT_FILE.write("	logic [WIDTH-1:0] z_fc[0:"+str(config.classes)+"-1];\n")
		OUTPUT_FILE.write("	logic [WIDTH-1:0] z_reg[0:"+str(config.classes)+"-1];\n")
	OUTPUT_FILE.write("	output [WIDTH-1:0] z;\n")
	OUTPUT_FILE.write("	\n")
	OUTPUT_FILE.write("	genvar h,i,j,k;\n")
	if config.conv:
		OUTPUT_FILE.write("	generate\n")
		OUTPUT_FILE.write("		for (h = 0; h < "+str(config.input_shape[0])+"; h++) begin\n")
		OUTPUT_FILE.write("			for (i = 0; i < "+str(config.input_shape[2])+"; i++) begin\n")
		OUTPUT_FILE.write("				demultiplexer_1d #(.WIDTH(WIDTH), .MAX("+str(config.input_shape[1])+")) demux(.x(x), .clk(clk), .en(en_in[h][i]), .z(xx[h][i]));\n")
		OUTPUT_FILE.write("			end\n")
		OUTPUT_FILE.write("		end\n")
		OUTPUT_FILE.write("	endgenerate\n")
		OUTPUT_FILE.write("	generate\n")
		OUTPUT_FILE.write("		for (h = 0; h < "+str(config.input_shape[0])+"; h++) begin\n")
		OUTPUT_FILE.write("			for (i = 0; i < "+str(config.input_shape[2])+"; i++) begin\n")
		OUTPUT_FILE.write("				for (j = 0; j < "+str(config.input_shape[1])+"; j++) begin\n")
		OUTPUT_FILE.write("					register_n #(.N(WIDTH)) reg_in(.clk(clk), .reg_e(ctrl), .reg_in(xx[h][i][j]), .reg_out(x_conv[h][i][j]));\n")
		OUTPUT_FILE.write("				end\n")
		OUTPUT_FILE.write("			end\n")
		OUTPUT_FILE.write("		end\n")
		OUTPUT_FILE.write("	endgenerate\n")
		OUTPUT_FILE.write("\n")
		OUTPUT_FILE.write("	pack_conv #(.WIDTH(WIDTH)) pack_conv(.x(xx), .z(z_conv), .clk(clk), .ctrl(ctrl));\n")
		OUTPUT_FILE.write("	generate\n")
		OUTPUT_FILE.write("		for (i = 0; i < "+str(shape[0])+"; i++) begin\n")
		OUTPUT_FILE.write("			for (j = 0; j < "+str(shape[2])+"-1; j++) begin\n")
		OUTPUT_FILE.write("				for (k = 0; k < "+str(shape[1])+"-1; k++) begin\n")
		OUTPUT_FILE.write("					assign z_flatten[i*"+str(shape[1])+"*"+str(shape[2])+"+j*"+str(shape[1])+"+k] = z_conv[i][j][k];\n")
		OUTPUT_FILE.write("				end\n")
		OUTPUT_FILE.write("			end\n")
		OUTPUT_FILE.write("		end\n")
		OUTPUT_FILE.write("	endgenerate\n")
		OUTPUT_FILE.write("	assign x_fc = z_flatten;\n")
	elif config.fc:
		OUTPUT_FILE.write("	demultiplexer_1d #(.WIDTH(WIDTH), .MAX("+str(config.input_shape[0])+")) demux(.x(x), .clk(clk), .en(en_in), .z(x_fc));;\n")
	if config.fc:
		OUTPUT_FILE.write("	pack_fc #(.WIDTH(WIDTH)) pack_fc(.x(x_fc), .z(z_fc), .clk(clk), .ctrl(ctrl));\n")
		OUTPUT_FILE.write("	generate\n")
		OUTPUT_FILE.write("		for (i = 0; i < "+str(config.classes)+"; i++) begin\n")
		OUTPUT_FILE.write("			register_n #(.N(WIDTH)) reg_out(.clk(clk), .reg_e(1'b1), .reg_in(z_fc[i]), .reg_out(z_reg[i]));\n")
		OUTPUT_FILE.write("		end\n")
		OUTPUT_FILE.write("	endgenerate\n")
		OUTPUT_FILE.write("\n")
		OUTPUT_FILE.write("	multiplexer_1d #(.WIDTH(WIDTH), .MAX("+str(config.classes)+")) mux(.x(z_reg), .clk(clk), .en(en_out), .z(z));\n")
	elif config.conv:
		OUTPUT_FILE.write("	generate\n")
		OUTPUT_FILE.write("		for (i = 0; i < OUT; i++) begin\n")
		OUTPUT_FILE.write("			register_n #(.N(WIDTH)) reg_out(.clk(clk), .reg_e(1'b1), .reg_in(z_flatten[i]), .reg_out(z_reg[i]));\n")
		OUTPUT_FILE.write("		end\n")
		OUTPUT_FILE.write("	endgenerate\n")
		OUTPUT_FILE.write("\n")
		OUTPUT_FILE.write("	multiplexer_1d #(.WIDTH(WIDTH), .MAX("+str(config.classes)+")) mux(.x(z_reg), .clk(clk), .en(en_out), .z(z));\n")
	OUTPUT_FILE.write("\n")
	OUTPUT_FILE.write("endmodule\n")
	OUTPUT_FILE.write("\n")