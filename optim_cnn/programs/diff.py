# coding: UTF-8

import subprocess
import sys
import modules
import os
import joblib
import matplotlib.pyplot as plt
import numpy as np
import shutil
import time
import copy

args = sys.argv
args.pop(0)
WIDTH = 8
IN = 84
OUT = 10
Q_ONLY = False
BIT_ONLY = False
MAKE_NEXT = False
CIRCUIT = False
NEXT = False
ALL = False
FLAG = False
hline = 0.0
val = 0

# WIDTH is not used.
val, WIDTH, Q_ONLY, BIT_ONLY, MAKE_NEXT, CIRCUIT, hline, NEXT, ALL, FLAG = modules.args_input(args,[["-l",val],["-w",WIDTH],["-q",Q_ONLY],["-b",BIT_ONLY],["-m",MAKE_NEXT],["-c",CIRCUIT],["-h",hline],["-n",NEXT],["-a",ALL],["-f",FLAG]])

NAME = ["conv1","conv2","fc1","fc2","fc3"]
print(NAME[val])

o_name = "bit-acc_c10.txt"

o_file = open(o_name,"w")
o_file.write("a,f,lut,bit,acc\n")
o_file.close()
x_y = []
figure = plt.figure()
max_acc = 0
max_args = [0,0]
DATA = []
ORG_FLAG = True
org_acc = 0
org_bit = 0
CURRENT_DIR=["./"]
val=0
result=[]
current=[]
def result_data(val):
	layer = NAME[val]
	CURRENT_DIR.append("cifar-10_"+layer+"/")
	i_file = "".join(CURRENT_DIR)+"result_of_quantize.txt"
	with open(i_file,"r") as f:
		READLINES = f.readlines()
		READLINES.pop(0)
	t = 0
	for L in READLINES:
		sumoflut,acc,a,f,lut = L.replace(" ","").rstrip("]\n").lstrip("[").split(",")
		name = NAME[val]+"_{}_{}_{}".format(a,f,lut)
		CURRENT_DIR.append(name+"/")
		current.append([int(sumoflut),t])
		if val < 4:
			result_data(val+1)
			current.pop()
		else:
			tmp_list = copy.deepcopy(current)
			result.append([tmp_list,float(acc)])
			current.pop()
		CURRENT_DIR.pop()
		t += 1
	CURRENT_DIR.pop()

def result_data_bit(val):
	layer = NAME[val]
	CURRENT_DIR.append("cifar-10_"+layer+"/")
	i_file = "".join(CURRENT_DIR)+"result_of_quantize.txt"
	with open(i_file,"r") as f:
		READLINES = f.readlines()
		READLINES.pop(0)
	for L in READLINES:
		sumoflut,acc,bit = L.replace(" ","").rstrip("]\n").lstrip("[").split(",")
		name = NAME[val]+"_{}bit".format(bit)
		CURRENT_DIR.append(name+"/")
		current.append([int(sumoflut),bit])
		if val < 4:
			result_data_bit(val+1)
			current.pop()
		else:
			tmp_list = copy.deepcopy(current)
			result.append([tmp_list,float(acc)])
			current.pop()
		CURRENT_DIR.pop()
	CURRENT_DIR.pop()

result_data(0)
print(len(result))
circuit_acc = []
for R in result:
	circuit = R[0][0][0]*28*28+R[0][1][0]*12*12+R[0][2][0]+R[0][3][0]+R[0][4][0]
	acc = R[1]
	circuit_acc.append([circuit,acc,[R[0][0][1],R[0][1][1],R[0][2][1],R[0][3][1],R[0][4][1]],0])

CURRENT_DIR = ["../same/"]
result = []
result_data_bit(0)
print(len(result))
for R in result:
	circuit = R[0][0][0]*28*28+R[0][1][0]*12*12+R[0][2][0]+R[0][3][0]+R[0][4][0]
	acc = R[1]
	circuit_acc.append([circuit,acc,[R[0][0][1],R[0][1][1],R[0][2][1],R[0][3][1],R[0][4][1]],1])
#plt.plot(12526594,1-0.6372999548912048,marker="x",color="black")

plt.xlabel("LUT",fontsize=20)
plt.ylabel("Error",fontsize=20)
good = []
efficient = []
cur_acc = 0
cur_lut = 0
circuit_acc.sort()
for d in circuit_acc:
	lut, acc, t, c = d
	if cur_acc < acc:
		if cur_lut == lut:
			good.pop()
		cur_lut = lut
		cur_acc = acc
		good.append(d)
for d in good:
	lut, acc, t, c = d
	c = (1,0,0) if c == 0 else (0,0,1)
	plt.plot(int(lut),1-float(acc),marker="o",color=c)
	c = (0,0,0)
	plt.plot(int(lut),1-float(acc),marker="+",color=c)
o_file = "./result_good.txt"
with open(o_file,"w") as f:
	print(good,file=f)
	for g in good:
		lut, acc, t, c =g
		print("{},{},{}".format(lut,acc,t),file=f)
print(good)

plt.show()
figure.savefig("diff_allcircuit-acc.png")