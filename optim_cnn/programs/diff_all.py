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
ORG_FLAG = False
org_acc = 0
org_bit = 0
CURRENT_DIR=["./"]
val=0
result=[]
current=[]
def result_data():
	for i in range(5):
		layer = NAME[i]
		CURRENT_DIR.append("cifar-10_"+layer+"/")
	i_file = "".join(CURRENT_DIR)+"result_of_quantize.txt"
	with open(i_file,"r") as f:
		READLINES = f.readlines()
	t = 0
	for L in READLINES:
		sumoflut,acc,a,f,name = L.replace(" ","").rstrip("]\n").lstrip("[").split(",")
		result.append([int(sumoflut),float(acc)])

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

result_data()
print(len(result))
circuit_acc = []
bit_list = []
for R in result:
	sumoflut,acc = R
	circuit = sumoflut
	c = (1,0,0)
	plt.plot(circuit,1-acc,marker=".",color=c)
	#circuit_acc.append([circuit,acc,0])
	#bit_list.append([circuit,acc,0])

CURRENT_DIR = ["../same/"]
result = []
result_data_bit(0)
print(len(result))
for R in result:
	circuit = R[0][0][0]*28*28+R[0][1][0]*12*12+R[0][2][0]+R[0][3][0]+R[0][4][0]
	acc = R[1]
	c = (0,0,1)
	#plt.plot(circuit,1-acc,marker=".",color=c)
	bit_list.append([circuit,acc,1])

plt.plot(12526594,1-0.6372999548912048,marker="x",color="black")
bit_list.sort()

cur_acc = 0.6372999548912048-0.05
cur_circuit = 0
for b in bit_list:
	circuit, acc, _ = b
	if acc > cur_acc:
		cur_acc = acc
		cur_circuit = circuit
		circuit_acc.append(b)

for res in circuit_acc:
	circuit, acc, col = res
	c = (0,0,1)
	plt.plot(circuit,1-acc,marker=".",color=c)


if not ORG_FLAG:
	plt.xlabel("# of LUTs",fontsize=20)
	plt.ylabel("Error",fontsize=20)
	figure.savefig("diff_allcircuit-acc.png")
	plt.show()
	exit()

plt.xlabel("# of LUTs",fontsize=20)
plt.ylabel("Error",fontsize=20)

plt.show()
figure.savefig("original.png")