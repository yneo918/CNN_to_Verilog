# coding: UTF-8

import subprocess
import sys
import modules
import os
import joblib
import numpy as np

args = sys.argv
args.pop(0)
WIDTH = 8
START = -(2**(WIDTH-1))
FINISH = 2**(WIDTH-1)
name = ""
IN = 84
OUT = 10

# WIDTH is not used.
START, FINISH, name, WIDTH = modules.args_input(args,[["-s",START],["-f",FINISH],["-n",name],["-w",WIDTH]])


A = [10,9,8,7,6,5,4,3,2,1.9,1.8,1.7,1.6,1.5,1.4,1.3,1.2,1.1,1,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0.05,0.01]
FLEX = [1,2,3,4,5,6,7,8,9,10]

i_file_name = "size_of_mult.txt"
i_file = open(i_file_name,"r")
LINES = i_file.readlines()
SIZE = []
INDEX = []
for L in LINES:
	DATA = L.split(",")
	INDEX.append(int(DATA[0]))
	SIZE.append([int(DATA[1]),int(DATA[2])])

for a in A:
	for flex in FLEX:
		size_l = 0
		size_c = 0
		name = "conv1_{}_{}".format(a,flex)
		data = joblib.load("/work2/y-neo/workspace/auto_optim/data_flex/conv1_"+str(a)+"_"+str(flex)+"/conv1.dat")
		data = np.array(data).flatten()*128
		for d in data:
			size_l += SIZE[INDEX.index(int(d))][0]
			size_c += SIZE[INDEX.index(int(d))][1]
		print("{} * {} = {}".format(size_l, 24*24, size_l*24*24))
		print("{} * {} = {}".format(size_c, 24*24, size_c*24*24))