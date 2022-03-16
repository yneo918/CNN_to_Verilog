# coding: UTF-8

import subprocess
import sys
import os
import joblib
import time
import math

def generate_conv_layer_single(i_file_name, WIDTH = 8, cin = 3, ch = 0, l = 1, F = 5):
	O_FILE_NAME = "layer.sv"
	data = joblib.load(i_file_name)
	nonzero = 0
	OUT_LIST = []
	for h in range(cin):
		for i in range(F):
			for j in range(F):
				if int(data[ch][h][i][j]*128) != 0:
					OUT_LIST.append("	booth_"+str(int(data[ch][h][i][j]*128)).zfill(4).replace("-","_")+" #(.WIDTH(WIDTH)) mul"+str(nonzero).zfill(2)+"(.x(x["+str(h*F*F+i*F+j)+"]), .z(tmp00["+str(nonzero)+"]));\n")
					nonzero += 1
	OUTPUT_FILE = open("./srcs/"+O_FILE_NAME,"w")
	OUTPUT_FILE.write("module layer\n")
	OUTPUT_FILE.write("//module layer_"+str(F)+"_L"+str(l)+"_N"+str(ch)+"\n")
	OUTPUT_FILE.write("	#(parameter WIDTH = 8)\n")
	OUTPUT_FILE.write("	(x, z);\n")
	OUTPUT_FILE.write("	localparam F = "+str(F)+", CIN = "+str(cin)+";\n")
	OUTPUT_FILE.write("	input [WIDTH-1:0] x[0:CIN*F*F-1];\n")
	OUTPUT_FILE.write("	output [WIDTH*2+$clog2("+str(nonzero)+")-1:0] z;\n")
	for i in range(math.ceil(math.log2(nonzero))+1):
		OUTPUT_FILE.write("	wire [WIDTH*2-1+"+str(i)+":0] tmp"+str(i).zfill(2)+"[0:"+str(math.ceil(nonzero/(2**i))-1)+"];\n")
	OUTPUT_FILE.writelines(OUT_LIST)
	add_num = 0
	num = nonzero
	for i in range(1,math.ceil(math.log2(nonzero))+1):
		for j in range(math.ceil(nonzero/(2**i))):
			if j == math.ceil(nonzero/(2**i)-1):
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
	OUTPUT_FILE.write("	relu #(.WIDTH(WIDTH*2+$clog2(CIN*F*F))) ReLU(.a(tmp"+str(math.ceil(math.log2(nonzero))).zfill(2)+"[0]), .b("+str(WIDTH*2+int(math.log2(nonzero)+1))+"'h0), .sel(tmp"+str(math.ceil(math.log2(nonzero))).zfill(2)+"[0][WIDTH*2+$clog2(CIN*F*F)-1]), .out(z));\n")
	OUTPUT_FILE.write("endmodule\n\n")
	OUTPUT_FILE.close()

	return nonzero

def generate_conv_top(i_file_name, WIDTH = 8, cin = 3, ch = 0, l = 1, F = 5, num = 0):
	O_FILE_NAME = "pack.sv"
	OUTPUT_FILE = open("./srcs/"+O_FILE_NAME,"w")
	OUTPUT_FILE.write('module top\n')
	OUTPUT_FILE.write('	#(parameter WIDTH = 8)\n')
	OUTPUT_FILE.write('	(x, z, clk, ctrl, en);\n')
	OUTPUT_FILE.write('\n')
	OUTPUT_FILE.write('	input clk, ctrl;\n')
	OUTPUT_FILE.write('	input en;\n')
	OUTPUT_FILE.write('	input [WIDTH-1:0] x;\n')
	OUTPUT_FILE.write('	logic [WIDTH-1:0] x_demux[0:'+str(F*F*cin)+'-1];\n')
	OUTPUT_FILE.write('	output [WIDTH*2+$clog2('+str(num)+')-1:0] z;\n')
	OUTPUT_FILE.write('	logic [WIDTH-1:0] x_reg[0:'+str(F*F*cin)+'-1];\n')
	OUTPUT_FILE.write('	logic [WIDTH*2+$clog2('+str(num)+')-1:0] z_reg;\n')
	OUTPUT_FILE.write('\n')
	OUTPUT_FILE.write('	genvar i;\n')
	OUTPUT_FILE.write('	layer #(.WIDTH(WIDTH)) conv(.x(x_reg), .z(z_reg));\n')
	OUTPUT_FILE.write('	demultiplexer_1d #(.WIDTH(WIDTH), .MAX('+str(F*F*cin)+')) demux(.x(x), .clk(clk), .en(en_in), .z(x_demux));\n')
	OUTPUT_FILE.write('	generate\n')
	OUTPUT_FILE.write('		for (i = 0; i < '+str(F*F*cin)+'; i++) begin\n')
	OUTPUT_FILE.write('			register_n #(.N(WIDTH)) reg_in(.clk(clk), .reg_e(ctrl), .reg_in(x_demux[i]), .reg_out(x_reg[i]));\n')
	OUTPUT_FILE.write('		end\n')
	OUTPUT_FILE.write('	endgenerate\n')
	OUTPUT_FILE.write('	register_n #(.N(WIDTH*2+$clog2('+str(num)+'))) reg_out(.clk(clk), .reg_e(ctrl), .reg_in(z_reg), .reg_out(z));\n')
	OUTPUT_FILE.write('\n')
	OUTPUT_FILE.write('endmodule\n')
	OUTPUT_FILE.close()


def generate_fc_layer_single(i_file_name, WIDTH = 8, IN = 400, ch = 0, l = 1):
	O_FILE_NAME = "layer.sv"
	data = joblib.load(i_file_name)
	nonzero = 0
	OUT_LIST = []
	for i in range(IN):
		if int(data[ch][i]*128) != 0:
			OUT_LIST.append("	booth_"+str(int(data[ch][i]*128)).zfill(4).replace("-","_")+" #(.WIDTH(WIDTH)) mul"+str(nonzero).zfill(2)+"(.x(x["+str(i)+"]), .z(tmp00["+str(nonzero)+"]));\n")
			nonzero += 1
	OUTPUT_FILE = open("./srcs/"+O_FILE_NAME,"w")
	OUTPUT_FILE.write("module layer\n")
	OUTPUT_FILE.write("	#(parameter WIDTH = 8)\n")
	OUTPUT_FILE.write("	(x, z);\n")
	OUTPUT_FILE.write("	localparam IN = "+str(IN)+";\n")
	OUTPUT_FILE.write("	input [WIDTH-1:0] x[0:IN-1];\n")
	OUTPUT_FILE.write("	output [WIDTH*2+$clog2("+str(nonzero)+")-1:0] z;\n")
	for i in range(math.ceil(math.log2(nonzero))+1):
		OUTPUT_FILE.write("	wire [WIDTH*2-1+"+str(i)+":0] tmp"+str(i).zfill(2)+"[0:"+str(math.ceil(nonzero/(2**i))-1)+"];\n")
	OUTPUT_FILE.writelines(OUT_LIST)
	add_num = 0
	num = nonzero
	for i in range(1,math.ceil(math.log2(nonzero))+1):
		for j in range(math.ceil(nonzero/(2**i))):
			if j == math.ceil(nonzero/(2**i)-1):
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
	OUTPUT_FILE.write("	relu #(.WIDTH(WIDTH*2+$clog2(IN))) ReLU(.a(tmp"+str(math.ceil(math.log2(nonzero))).zfill(2)+"[0]), .b("+str(WIDTH*2+int(math.log2(nonzero)+1))+"'h0), .sel(tmp"+str(math.ceil(math.log2(nonzero))).zfill(2)+"[0][WIDTH*2+$clog2(IN)-1]), .out(z));\n")
	OUTPUT_FILE.write("endmodule\n\n")
	OUTPUT_FILE.close()

	return nonzero

def generate_fc_top(WIDTH = 8, IN = 400, ch = 0, l = 1, num = 0):
	O_FILE_NAME = "pack.sv"
	OUTPUT_FILE = open("./srcs/"+O_FILE_NAME,"w")
	OUTPUT_FILE.write('module top\n')
	OUTPUT_FILE.write('	#(parameter WIDTH = 8)\n')
	OUTPUT_FILE.write('	(x, z, clk, ctrl, en);\n')
	OUTPUT_FILE.write('\n')
	OUTPUT_FILE.write('	input clk, ctrl;\n')
	OUTPUT_FILE.write('	input en;\n')
	OUTPUT_FILE.write('	input [WIDTH-1:0] x;\n')
	OUTPUT_FILE.write('	logic [WIDTH-1:0] x_demux[0:'+str(IN)+'-1];\n')
	OUTPUT_FILE.write('	output [WIDTH*2+$clog2('+str(num)+')-1:0] z;\n')
	OUTPUT_FILE.write('	logic [WIDTH-1:0] x_reg[0:'+str(IN)+'-1];\n')
	OUTPUT_FILE.write('	logic [WIDTH*2+$clog2('+str(num)+')-1:0] z_reg;\n')
	OUTPUT_FILE.write('\n')
	OUTPUT_FILE.write('	genvar i;\n')
	OUTPUT_FILE.write('	layer #(.WIDTH(WIDTH)) conv(.x(x_reg), .z(z_reg));\n')
	OUTPUT_FILE.write('	demultiplexer_1d #(.WIDTH(WIDTH), .MAX('+str(IN)+')) demux(.x(x), .clk(clk), .en(en), .z(x_demux));\n')
	OUTPUT_FILE.write('	generate\n')
	OUTPUT_FILE.write('		for (i = 0; i < '+str(IN)+'; i++) begin\n')
	OUTPUT_FILE.write('			register_n #(.N(WIDTH)) reg_in(.clk(clk), .reg_e(ctrl), .reg_in(x_demux[i]), .reg_out(x_reg[i]));\n')
	OUTPUT_FILE.write('		end\n')
	OUTPUT_FILE.write('	endgenerate\n')
	OUTPUT_FILE.write('	register_n #(.N(WIDTH*2+$clog2('+str(num)+'))) reg_out(.clk(clk), .reg_e(ctrl), .reg_in(z_reg), .reg_out(z));\n')
	OUTPUT_FILE.write('\n')
	OUTPUT_FILE.write('endmodule\n')
	OUTPUT_FILE.close()



NAME = ["conv1","conv2","fc1","fc2","fc3"]
WIDTH = 8

cin = [3,6]
cout = [6,16]
for val in [0,1]:
	for ch in range(cout[val]):
		name = "{}_{}".format(NAME[val],ch)
		print(name)
		if os.path.exists("output/"+name+"/report/timing-summary.rpt"):
			continue
		command = ["python3", "src/genShell_conv.py", "\""+name+"\""]
		subprocess.call(command)
		nonzero = generate_conv_layer_single(i_file_name=NAME[val]+".dat",ch=ch, cin=cin[val], l=val+1, F=5)
		generate_conv_top(i_file_name=NAME[val]+".dat",ch=ch, cin=cin[val], l=val+1, F=5, num =nonzero)
		command = ["./run.sh"]
		subprocess.call(command)
		command = "cp srcs/layer.sv output/"+name+"/"
		subprocess.call(command,shell=True)


fc_in = [400,128,84]
fc_out = [128,84,10]
for val in [2,3,4]:
	for ch in range(fc_out[val-2]):
		name = "{}_{}".format(NAME[val],ch)
		print(name)
		if os.path.exists("output/"+name+"/report/timing-summary.rpt"):
			continue
		command = ["python3", "src/genShell_fc.py", "\""+name+"\""]
		subprocess.call(command)
		nonzero = generate_fc_layer_single(i_file_name=NAME[val]+".dat",ch=ch, IN=fc_in[val-2], l=val+1)
		generate_fc_top(ch=ch, IN=fc_in[val-2], l=val+1, num =nonzero)
		command = ["./run.sh"]
		subprocess.call(command)
		command = "cp srcs/layer.sv output/"+name+"/"
		subprocess.call(command,shell=True)