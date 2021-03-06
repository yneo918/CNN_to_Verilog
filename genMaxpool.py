#!/usr/bin/env python3.6.9

import math
import sys
import modules
import joblib

def generate_conv(WIDTH = 8, c = 6, l = 0, W = 28, H = 28, F = 5):
	O_FILE_NAME = "maxpool_"+str(F)+"_L"+str(l)+".sv"
	data = joblib.load(i_file_name)
	OUTPUT_FILE = open("./srcs/"+O_FILE_NAME,"w")
	OUTPUT_FILE.write("module conv2d_L"+str(l)+"_top\n")
	OUTPUT_FILE.write("	#(parameter WIDTH = 8, W = "+str(W)+", H = "+str(H)+", CIN = "+str(cin)+", COUT = "+str(cout)+", F = "+str(F)+")\n")
	OUTPUT_FILE.write("	(x, z);\n")
	OUTPUT_FILE.write("	input [WIDTH-1:0] x[0:CIN-1][0:H-1][0:W-1];\n")
	OUTPUT_FILE.write("	output [WIDTH*2+$clog2(CIN*F*F)-1:0] z[0:COUT-1][0:H-F][0:W-F];\n")
	OUTPUT_FILE.write("	wire [WIDTH-1:0] x_in[0:H-1][0:W-1][0:CIN*F*F-1];\n")
	OUTPUT_FILE.write("	genvar h, i, j, k;\n")
	OUTPUT_FILE.write("	generate\n")
	OUTPUT_FILE.write("		for (i = 0; i < H-(F-1); i++) begin\n")
	OUTPUT_FILE.write("			for (j = 0; j < W-(F-1); j++) begin\n")
	OUTPUT_FILE.write("				for (h = 0; h < CIN; h++) begin\n")
	OUTPUT_FILE.write("					for (k = 0; k < F*F; k++) begin\n")
	OUTPUT_FILE.write("						assign x_in[i][j][h*F*F+k] = x[h][i+k/F][j+k%F];\n")
	OUTPUT_FILE.write("					end\n")
	OUTPUT_FILE.write("				end\n")
	OUTPUT_FILE.write("			end\n")
	OUTPUT_FILE.write("		end\n")
	OUTPUT_FILE.write("	endgenerate\n")
	for i in range(cout):
		OUTPUT_FILE.write("	generate\n")
		OUTPUT_FILE.write("		for (i = 0; i < H-(F-1); i++) begin\n")
		OUTPUT_FILE.write("			for (j = 0; j < W-(F-1); j++) begin\n")
		OUTPUT_FILE.write("				conv2d_"+str(F)+"_L"+str(l)+"_N"+str(i)+" #(.WIDTH(WIDTH), .F("+str(F)+")) conv2d_"+str(F)+"_L"+str(l)+"_N"+str(i)+"(.x(x_in[i][j]), .z(z["+str(i)+"][i][j]));\n")
		OUTPUT_FILE.write("			end\n")
		OUTPUT_FILE.write("		end\n")
		OUTPUT_FILE.write("	endgenerate\n")
	OUTPUT_FILE.write("endmodule\n\n")
	for ch in range(cout):
		OUTPUT_FILE.write("module conv2d_"+str(F)+"_L"+str(l)+"_N"+str(ch)+"\n")
		OUTPUT_FILE.write("	#(parameter WIDTH = 8, F = "+str(F)+", CIN = "+str(cin)+")\n")
		OUTPUT_FILE.write("	(x, z);\n")
		OUTPUT_FILE.write("	input [WIDTH-1:0] x[0:CIN*F*F-1];\n")
		OUTPUT_FILE.write("	output [WIDTH*2+$clog2(CIN*F*F)-1:0] z;\n")
		for i in range(math.ceil(math.log2(cin*F*F))+1):
			OUTPUT_FILE.write("	wire [WIDTH*2-1+"+str(i)+":0] tmp"+str(i).zfill(2)+"[0:"+str(math.ceil(cin*F*F/(2**i))-1)+"];\n")
		for h in range(cin):
			for i in range(F):
				for j in range(F):
					#print(ch,h,i,j)
					OUTPUT_FILE.write("	booth_"+str(int(data[ch][h][i][j]*128)).zfill(4).replace("-","_")+" #(.WIDTH(WIDTH)) mul"+str(h*F*F+i*F+j).zfill(2)+"(.x(x["+str(h*F*F+i*F+j)+"]), .z(tmp00["+str(h*F*F+i*F+j)+"]));\n")
		add_num = 0
		num = cin*F*F
		for i in range(1,math.ceil(math.log2(cin*F*F))+1):
			for j in range(math.ceil(cin*F*F/(2**i))):
				if j == math.ceil(cin*F*F/(2**i)-1):
					if (j+1)*2 != num:
						OUTPUT_FILE.write("	assign tmp"+str(i).zfill(2)+"["+str(j)+"] = "+str(WIDTH)+"'(signed'(tmp"+str(i-1).zfill(2)+"["+str(j*2)+"][WIDTH-1:1]));\n")
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