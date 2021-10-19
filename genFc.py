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
	OUTPUT_FILE.write("	#(parameter WIDTH = 8)\n")
	if FIXED:
		OUTPUT_FILE.write("	(x, z);\n")
		OUTPUT_FILE.write("	localparam IN = "+str(IN)+", OUT = "+str(OUT)+";\n")
		OUTPUT_FILE.write("	input [WIDTH-1:0] x[0:IN-1];\n")
	else:
		OUTPUT_FILE.write("	(x, y, z);\n")
		OUTPUT_FILE.write("	localparam IN = "+str(IN)+", OUT = "+str(OUT)+";\n")
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
						OUTPUT_FILE.write("	assign tmp"+str(i).zfill(2)+"["+str(j)+"]["+str(k)+"] = $signed(tmp"+str(i-1).zfill(2)+"["+str(j*2)+"]["+str(k)+"]);\n")
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
	OUTPUT_FILE.write("			relu #(.WIDTH(WIDTH*2+$clog2(IN))) ReLU(.a(tmp"+str(math.ceil(math.log2(IN))).zfill(2)+"[0][i]), .b("+str(int(WIDTH*2+math.ceil(math.log2(IN))))+"'h0), .sel(tmp"+str(math.ceil(math.log2(IN))).zfill(2)+"[0][i][WIDTH*2+$clog2(IN)-1]), .out(z[i]));\n")
	OUTPUT_FILE.write("		end\n")
	OUTPUT_FILE.write("	endgenerate\n")
	OUTPUT_FILE.write("endmodule\n\n")


def generate_fc_layer_tb(WIDTH = 8, IN = 256, OUT = 128, i_file_name = "", l = 0, FIXED = True):
	O_FILE_NAME = "fc_L"+str(l)+"_tb.sv"

	w = set_weight(i_file_name = i_file_name, IN = IN, OUT = OUT)

	OUTPUT_FILE = open("./srcs/"+O_FILE_NAME,"w")
	OUTPUT_FILE.write("module tb;\n")
	OUTPUT_FILE.write("	localparam WIDTH = "+str(WIDTH)+";\n")
	OUTPUT_FILE.write("	localparam IN = "+str(IN)+";\n")
	OUTPUT_FILE.write("	localparam OUT = "+str(OUT)+";\n")
	OUTPUT_FILE.write("	logic [WIDTH-1:0] x[0:IN-1];\n")
	OUTPUT_FILE.write("	logic [WIDTH*2+$clog2(IN)-1:0] z[0:OUT-1];\n")
	OUTPUT_FILE.write("	logic [WIDTH*2+$clog2(IN)-1:0] exp[0:OUT-1];\n")
	OUTPUT_FILE.write("	fc"+str(IN)+"_"+str(OUT)+" #(.WIDTH(WIDTH)) fc(.x(x), .z(z));\n")

	OUTPUT_FILE.write("	initial begin\n")

	OUTPUT_FILE.write("		$readmemh(\"exp\",exp);\n")
	OUTPUT_FILE.write("		x <= '{")
	for i in range(IN):
		OUTPUT_FILE.write("8'h0")
		if i < IN-1:
			OUTPUT_FILE.write(", ")
	OUTPUT_FILE.write("};\n")
	OUTPUT_FILE.write("\n")
	OUTPUT_FILE.write("		$monitor(\"")
	for i in range(IN):
		OUTPUT_FILE.write("x"+str(i)+"=0x%0h ")
		if (i+1) % (IN//8) == 0:
			OUTPUT_FILE.write("\\n")
	for i in range(OUT):
		OUTPUT_FILE.write("z"+str(i)+"=0x%0h ")
	OUTPUT_FILE.write("\",")

	for i in range(IN):
		OUTPUT_FILE.write("x["+str(i)+"], ")
	for i in range(OUT):
		OUTPUT_FILE.write("z["+str(i)+"]")
		if i < OUT-1:
			OUTPUT_FILE.write(", ")
	OUTPUT_FILE.write(");\n")
	x = []
	OUTPUT_FILE.write("		#10\n")
	OUTPUT_FILE.write("		x <= '{ ")
	for i in range(IN):
		a = random.randint(-128,127)
		x.append(a)
		N = hex(a & 0xff)[2:].lstrip("0x")
		if N == "":
			N = "0"
		OUTPUT_FILE.write("8'h"+N)
		if i < IN-1:
			OUTPUT_FILE.write(", ")
	OUTPUT_FILE.write(" };\n")
	OUTPUT_FILE.write("		#10\n")
	OUTPUT_FILE.write("		if (exp !== z)begin\n")
	OUTPUT_FILE.write("			$display(\"Mismatch Error\");\n")
	OUTPUT_FILE.write("			$display(\"out: z0=0x%0h z1=0x%0h z2=0x%0h z3=0x%0h z4=0x%0h z5=0x%0h z6=0x%0h z7=0x%0h z8=0x%0h z9=0x%0h \",z[0], z[1], z[2], z[3], z[4], z[5], z[6], z[7], z[8], z[9]);\n")
	OUTPUT_FILE.write("			$display(\"exp: z0=0x%0h z1=0x%0h z2=0x%0h z3=0x%0h z4=0x%0h z5=0x%0h z6=0x%0h z7=0x%0h z8=0x%0h z9=0x%0h \",exp[0], exp[1], exp[2], exp[3], exp[4], exp[5], exp[6], exp[7], exp[8], exp[9]);\n")
	OUTPUT_FILE.write("		end\n")
	OUTPUT_FILE.write("		if (exp == z)begin\n")
	OUTPUT_FILE.write("			$display(\"Matched: No Error\");\n")
	OUTPUT_FILE.write("		end\n")

	OUTPUT_FILE.write("		#10 $finish;\n")

	OUTPUT_FILE.write("\n")
	OUTPUT_FILE.write("	end\n")
	OUTPUT_FILE.write("endmodule\n")
	OUTPUT_FILE.close()

	#print(x)
	#print(w)
	s = 0
	s_list = []
	b = WIDTH*2+int(math.ceil(math.log2(IN)))
	mask = 2**b-1
	for j in range(OUT):
		for i in range(IN):
			tmp = x[i] * w[j][i]
			#print(hex(x[i] & 0xff)+" x "+hex(w[0][i] & 0xffff)+" = "+hex(tmp & 0xffff)+" "+str(tmp))
			s += tmp
		s_list.append(s)
		s = 0
	OUTPUT_FILE = open("./srcs/exp","w")
	for i in range(OUT):
		if s_list[i] > 0:
			OUTPUT_FILE.write(hex(mask & s_list[i]).lstrip("0x")+"\n")
		else:
			OUTPUT_FILE.write("0\n")
	#print(s_list)
	#print(hex(s_list[0]) if s_list[0] > 0 else 0)

	OUTPUT_FILE.close()