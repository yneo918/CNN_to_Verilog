#!/usr/bin/env python3.6.9

import math
import sys
import joblib
import copy

def generate_conv_layer_single(i_file_name, WIDTH = 8, cin = 1, i_file_name = "", ch = 0, l = 1):
	O_FILE_NAME = "conv2d_single_"+str(conv_num)+".sv"
	data = joblib.load(i_file_name)
	OUTPUT_FILE = open("./srcs/"+O_FILE_NAME,"w")
	OUTPUT_FILE.write("module conv2d_"+str(F)+"_L"+str(l)+"_N"+str(ch)+"\n")
	OUTPUT_FILE.write("	#(parameter WIDTH = 8)\n")
	OUTPUT_FILE.write("	(x, z);\n")
	OUTPUT_FILE.write("	localparam F = "+str(F)+", CIN = "+str(cin)+";\n")
	OUTPUT_FILE.write("	input [WIDTH-1:0] x[0:CIN*F*F-1];\n")
	OUTPUT_FILE.write("	output [WIDTH*2+$clog2(CIN*F*F)-1:0] z;\n")
	for i in range(math.ceil(math.log2(cin*F*F))+1):
		OUTPUT_FILE.write("	wire [WIDTH*2-1+"+str(i)+":0] tmp"+str(i).zfill(2)+"[0:"+str(math.ceil(cin*F*F/(2**i))-1)+"];\n")
	for h in range(cin):
		for i in range(F):
			for j in range(F):
				OUTPUT_FILE.write("	booth_"+str(int(data[ch][h][i][j]*128)).zfill(4).replace("-","_")+" #(.WIDTH(WIDTH)) mul"+str(h*F*F+i*F+j).zfill(2)+"(.x(x["+str(h*F*F+i*F+j)+"]), .z(tmp00["+str(h*F*F+i*F+j)+"]));\n")
	add_num = 0
	num = cin*F*F
	for i in range(1,math.ceil(math.log2(cin*F*F))+1):
		for j in range(math.ceil(cin*F*F/(2**i))):
			if j == math.ceil(cin*F*F/(2**i)-1):
				if (j+1)*2 != num:
					OUTPUT_FILE.write("	assign tmp"+str(i).zfill(2)+"["+str(j)+"] = $signed(tmp"+str(i-1).zfill(2)+"["+str(j*2)+"]);\n")
				else:
					ADD = "add2 #(.I_WIDTH(WIDTH*2+"+str(i-1)+"), .O_WIDTH(WIDTH*2+"+str(i)+")) "
					OUTPUT_FILE.write("	"+ADD+"add"+str(add_num).zfill(6)+"(.in0(tmp"+str(i-1).zfill(2)+"["+str(j*2)+"]), .in1(tmp"+str(i-1).zfill(2)+"["+str(j*2+1)+"]), .out(tmp"+str(i).zfill(2)+"["+str(j)+"]));\n")
					add_num += 1
				num = math.ceil(num/2)
			else:
				ADD = "add2 #(.I_WIDTH(WIDTH*2+"+str(i-1)+"), .O_WIDTH(WIDTH*2+"+str(i)+")) "
				OUTPUT_FILE.write("	"+ADD+"add"+str(add_num).zfill(6)+"(.in0(tmp"+str(i-1).zfill(2)+"["+str(j*2)+"]), .in1(tmp"+str(i-1).zfill(2)+"["+str(j*2+1)+"]), .out(tmp"+str(i).zfill(2)+"["+str(j)+"]));\n")
				add_num += 1
	OUTPUT_FILE.write("	relu #(.WIDTH(WIDTH*2+$clog2(CIN*F*F))) ReLU(.a(tmp"+str(math.ceil(math.log2(cin*F*F))).zfill(2)+"[0]), .b("+str(WIDTH*2+int(math.log2(cin*F*F)+1))+"'h0), .sel(tmp"+str(math.ceil(math.log2(cin*F*F))).zfill(2)+"[0][WIDTH*2+$clog2(CIN*F*F)-1]), .out(z));\n")
	OUTPUT_FILE.write("endmodule\n\n")
	OUTPUT_FILE.close()