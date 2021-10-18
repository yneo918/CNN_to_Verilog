#!/usr/bin/env python3.6.9

import random
import math
import sys
import joblib
import copy

def generate_fc(config):
	shape = copy.deepcopy(config.input_shape)
	i = 0
	f = True
	shape_list = []
	for L in config.layer:
		i += 1
		if L[0] == "fc":
			if f:
				l = i
				f = False
			shape_list.append([L[1],L[2]])
	O_FILE_NAME = "fc.sv"
	OUTPUT_FILE = open("./srcs/"+O_FILE_NAME,"w")
	OUTPUT_FILE.write("module pack_fc\n")
	OUTPUT_FILE.write("	#(parameter WIDTH = 8)\n")
	OUTPUT_FILE.write("	(x, z, clk, ctrl);\n")
	OUTPUT_FILE.write("\n")
	OUTPUT_FILE.write("	input clk, ctrl;\n")
	OUTPUT_FILE.write("	input [WIDTH-1:0] x[0:"+str(shape_list[0][0])+"-1];\n")
	OUTPUT_FILE.write("	//input integer sel0, sel1;\n")
	OUTPUT_FILE.write("	output [WIDTH-1:0] z[0:"+str(shape_list[len(shape_list)-1][1])+"-1];\n")
	for i in range(len(shape_list)):
		OUTPUT_FILE.write("	logic [WIDTH-1:0] x_L"+str(l+i)+"[0:"+str(shape_list[i][0])+"-1];\n")
		OUTPUT_FILE.write("	logic [WIDTH*2+$clog2("+str(shape_list[i][0])+")-1:0] z_L"+str(l+i)+"[0:"+str(shape_list[i][1])+"-1];\n")
	OUTPUT_FILE.write("\n")

	OUTPUT_FILE.write("	assign x_L"+str(l)+" = x;\n")
	OUTPUT_FILE.write("	genvar i;\n")
	for i in range(len(shape_list)):
		if i != 0:
			OUTPUT_FILE.write("	generate\n")
			OUTPUT_FILE.write("		for (i = 0; i < "+str(shape_list[i][0])+"; i++) begin\n")
			OUTPUT_FILE.write("			assign x_L"+str(l+i)+"[i] = z_L"+str(l+i-1)+"[i][WIDTH*2+$clog2("+str(shape_list[i-1][0])+")-1:WIDTH+$clog2("+str(shape_list[i-1][0])+")+1];\n")
			OUTPUT_FILE.write("		end\n")
			OUTPUT_FILE.write("	endgenerate\n")
		OUTPUT_FILE.write("	fc"+str(shape_list[i][0])+"_"+str(shape_list[i][1])+" fc_L"+str(l+i)+"(.x(x_L"+str(l+i)+"), .z(z_L"+str(l+i)+"));\n")
		if i == len(shape_list)-1:
			OUTPUT_FILE.write("	generate\n")
			OUTPUT_FILE.write("		for (i = 0; i < "+str(config.classes)+"; i++) begin\n")
			OUTPUT_FILE.write("			assign z[i] = z_L"+str(l+i)+"[i][WIDTH*2+$clog2("+str(shape_list[i][0])+")-1:WIDTH+$clog2("+str(shape_list[i][0])+")+1];\n")
			OUTPUT_FILE.write("		end\n")
			OUTPUT_FILE.write("	endgenerate\n")
	OUTPUT_FILE.write("endmodule\n")


def generate_fc_layer(WIDTH = 8, IN = 256, OUT = 128, i_file_name = "", l = 0, FIXED = True):
	O_FILE_NAME = "fc_L"+str(l)+".sv"

	w = set_weight(i_file_name = i_file_name, IN = IN, OUT = OUT)

	OUTPUT_FILE = open("./srcs/"+O_FILE_NAME,"w")
	OUTPUT_FILE.write("module fc"+str(IN)+"_"+str(OUT)+"\n")
	OUTPUT_FILE.write("	#(parameter WIDTH = 8, IN = "+str(IN)+", OUT = "+str(OUT)+")\n")
	if FIXED:
		OUTPUT_FILE.write("	(x, z);\n")
		OUTPUT_FILE.write("	input [WIDTH-1:0] x[0:IN-1];\n")
	else:
		OUTPUT_FILE.write("	(x, y, z);\n")
		OUTPUT_FILE.write("	input [WIDTH-1:0] x[0:IN-1];\n")
		OUTPUT_FILE.write("	input [WIDTH-1:0] y[0:IN-1];\n")

	OUTPUT_FILE.write("	output [WIDTH*2+$clog2(IN)-1:0] z[0:OUT-1];\n")
	for i in range(math.ceil(math.log2(IN))+1):
		OUTPUT_FILE.write("	wire [WIDTH*2-1+"+str(i)+":0] tmp"+str(i).zfill(2)+"[0:"+str(math.ceil(IN/(2**i))-1)+"][0:OUT-1];\n")
	OUTPUT_FILE.write("\n")
	MULT = "mult #(.I_WIDTH(WIDTH), .O_WIDTH(WIDTH*2))"
	for j in range(OUT):
		for i in range(IN):
			if FIXED:
				OUTPUT_FILE.write("	booth_"+str(w[j][i]).zfill(4).replace("-","_")+" #(.WIDTH(WIDTH)) mul"+str(j).zfill(4)+str(i).zfill(4)+"(.x(x["+str(i)+"]), .z(tmp00["+str(i)+"]["+str(j)+"]));\n")
			else:
				OUTPUT_FILE.write("	"+MULT+" mul"+str(i).zfill(4)+"(.in0(x["+str(i)+"]), .in1(y["+str(i)+"]), .out(tmp00["+str(i)+"]["+str(j)+"]));\n")
	add_num = 0
	for k in range(OUT):
		num = IN
		for i in range(1,math.ceil(math.log2(IN))+1):
			for j in range(math.ceil(IN/(2**i))):
				if j == math.ceil(IN/(2**i)-1):
					if (j+1)*2 != num:
						OUTPUT_FILE.write("	assign tmp"+str(i).zfill(2)+"["+str(j)+"]["+str(k)+"] = "+str(WIDTH)+"'(signed'(tmp"+str(i-1).zfill(2)+"["+str(j*2)+"]["+str(k)+"][WIDTH-1:1]));\n")
					else:
						ADD = "add2 #(.I_WIDTH(WIDTH*2+"+str(i-1)+"), .O_WIDTH(WIDTH*2+"+str(i)+")) "
						OUTPUT_FILE.write("	"+ADD+"add"+str(add_num).zfill(6)+"(.in0(tmp"+str(i-1).zfill(2)+"["+str(j*2)+"]["+str(k)+"]), .in1(tmp"+str(i-1).zfill(2)+"["+str(j*2+1)+"]["+str(k)+"]), .out(tmp"+str(i).zfill(2)+"["+str(j)+"]["+str(k)+"]));\n")
						add_num += 1
					num = math.ceil(num/2)
				else:
					ADD = "add2 #(.I_WIDTH(WIDTH*2+"+str(i-1)+"), .O_WIDTH(WIDTH*2+"+str(i)+")) "
					OUTPUT_FILE.write("	"+ADD+"add"+str(add_num).zfill(6)+"(.in0(tmp"+str(i-1).zfill(2)+"["+str(j*2)+"]["+str(k)+"]), .in1(tmp"+str(i-1).zfill(2)+"["+str(j*2+1)+"]["+str(k)+"]), .out(tmp"+str(i).zfill(2)+"["+str(j)+"]["+str(k)+"]));\n")
					add_num += 1
	generate_relu(OUTPUT_FILE, IN, WIDTH)

def set_weight(i_file_name = "", IN = 256, OUT = 128):
	INPUT = True if not i_file_name  == "" else False
	if INPUT:
		data = joblib.load(i_file_name)
	w = [] 
	for i in range(OUT):
		t = []
		for j in range(IN):
			val = 0
			if INPUT:
				val = int(data[i][j]*128)
			else:
				val = random.randint(-128,127)
			t.append(val)
		w.append(t)
	return w

def generate_relu(OUTPUT_FILE, IN = 128, WIDTH = 8):
	OUTPUT_FILE.write("	genvar i;\n")
	OUTPUT_FILE.write("	generate\n")
	OUTPUT_FILE.write("		for (i = 0; i < OUT; i++) begin\n")
	OUTPUT_FILE.write("			relu #(.WIDTH(WIDTH*2+$clog2(IN))) ReLU(.a(tmp"+str(math.ceil(math.log2(IN))).zfill(2)+"[0][i]), .b("+str(WIDTH)+"'h0), .sel(tmp"+str(math.ceil(math.log2(IN))).zfill(2)+"[0][i][WIDTH-1]), .out(z[i]));\n")
	OUTPUT_FILE.write("		end\n")
	OUTPUT_FILE.write("	endgenerate\n")
	OUTPUT_FILE.write("endmodule\n\n")