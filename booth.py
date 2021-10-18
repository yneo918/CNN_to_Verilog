#!/usr/bin/env python3.6
# coding: UTF-8
import modules
import sys

WIDTH = 8
o_file_name = "./srcs/booth.sv"

def val(x):
	sum = 0
	for i in range(WIDTH):
		sum += x[i] * (2**i)
	return sum

args = sys.argv
args.pop(0)
WIDTH, o_file_name = modules.args_input(args,[["-w",WIDTH],["-o",o_file_name]])

LIST = [0 for i in range(2**WIDTH)]
LIST_val = [[i-(2**(WIDTH-1))] for i in range(2**(WIDTH))]


for i in range(3**WIDTH):
	BUF = []
	x = i
	BUF.append(x%3-1)
	x //= 3
	while x > 0:
		BUF.append(x%3-1)
		x //= 3
	while len(BUF) < WIDTH:
		BUF.append(-1)
	if val(BUF) >2**(WIDTH-1)-1 or val(BUF) < -(2**(WIDTH-1)):
		continue
	v = val(BUF)
	BUF.reverse()
	LIST[v+2**(WIDTH-1)] += 1
	LIST_val[v+2**(WIDTH-1)].append(BUF)

MIN_LIST = []
max_min = 0
MAX_LIST = []
for i in range(2**(WIDTH)):
	min = 9
	T = []
	for j in range(LIST[i]):
		tmp = LIST_val[i][j+1].count(1) + LIST_val[i][j+1].count(-1)
		if tmp < min:
			min = tmp
			T = []
			T.append(LIST_val[i][j+1])
		elif tmp == min:
			T.append(LIST_val[i][j+1])
	MIN_LIST.append([LIST_val[i][0],T,min])
	if min > max_min:
		max_min = min
		MAX_LIST.append(LIST_val[i][0])
	elif min == max_min:
		MAX_LIST.append(LIST_val[i][0])
O_LIST = []

O_FILE = open(o_file_name,"w")
for i in range(-(2**WIDTH),2**WIDTH):
	O_FILE.write("module booth_"+str(i).zfill(4).replace("-","_")+"\n")
	O_FILE.write("	#(parameter WIDTH = 8)\n")
	O_FILE.write("	(x, z);\n")
	O_FILE.write("	input signed [WIDTH-1:0] x;\n")
	O_FILE.write("	output [WIDTH*2-1:0] z;\n")

	if i == 0:
		O_FILE.write("	assign z = "+str(WIDTH*2)+"'h0\n")
		O_FILE.write("endmodule\n\n")
		continue

	TARGET = MIN_LIST[i+2**(WIDTH-1)]
	T = TARGET[1][0]
	T.reverse()
	TP = []
	TM = []
	while T.count(1) > 0:
		TP.append(T.index(1))
		T[T.index(1)] = 0
	while T.count(-1) > 0:
		TM.append(T.index(-1))
		T[T.index(-1)] = 0
	if TARGET[2] == 1:
		if len(TP) > 0:
			O_FILE.write("	assign z = (WIDTH*2)'((WIDTH*2+1)'(x) << "+str(TP[0])+");\n")
		elif len(TM) > 0:
			O_FILE.write("	assign z = - (WIDTH*2)'((WIDTH*2+1)'(x) << "+str(TM[0])+");\n")
	else:
		O_FILE.write("	assign z = (WIDTH*2)'(")
		if len(TP) == 0 and len(TM) > 0:
				O_FILE.write(" - ")
		while len(TP) > 0:
			O_FILE.write("((WIDTH*2+1)'(x) << "+str(TP[0])+")")
			TP.pop(0)
			if len(TP)>0:
				O_FILE.write(" + ")
			elif len(TM)>0:
				O_FILE.write(" - ")
			else:
				O_FILE.write(");\n")
		while len(TM) > 0:
			O_FILE.write("((WIDTH*2+1)'(x) << "+str(TM[0])+")")
			TM.pop(0)
			if len(TM)>0:
				O_FILE.write(" - ")
			else:
				O_FILE.write(");\n")
	O_FILE.write("endmodule\n\n")
O_FILE.close()
