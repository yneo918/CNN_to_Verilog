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
val = 4
def result_data():
	for i in range(val + 1):
		layer = NAME[i]
		CURRENT_DIR.append("cifar-10_"+layer+"/")
	i_file = "".join(CURRENT_DIR)+"result_of_quantize.txt"
	print(i_file)
	with open(i_file,"r") as f:
		READLINES = f.readlines()
	t = 0
	for L in READLINES:
		sumoflut,acc,a,f,name = L.replace(" ","").rstrip("]\n").lstrip("[").split(",")
		result.append([int(sumoflut),float(acc),"_".join(name.replace("'","").split("_")[0:3])])

result_data()
print(len(result))
circuit_acc = []
bit_list = []
name_list = ["conv1_0.0_32","conv1_0.0_32","conv1_0.0_16","conv1_0.0_16","conv1_0.5_16","conv1_0.5_16","conv1_1.5_16","conv1_2.0_16","conv1_2.5_16","conv1_3.0_16","conv1_0.0_8","conv1_2.5_8","conv1_2.5_8","conv1_3.0_8","conv1_3.0_8"]
LL = len(name_list)-1
for R in result:
	sumoflut,acc,c1  = R
	circuit = sumoflut
	c = (1,0,0)
	#plt.plot(circuit,1-acc,marker=".",color=c)
	circuit_acc.append([circuit,acc,c1])
	bit_list.append([circuit,acc,c1])

plt.plot(12526594,1-0.6372999548912048,marker="x",color="black")
plt.xlabel("# of LUTs",fontsize=20)
plt.ylabel("Error",fontsize=20)
good = []
efficient = []
cur_acc = 0
cur_lut = 0
circuit_acc.sort()
for d in circuit_acc:
	lut, acc, c1 = d
	num = name_list.index(c1)
	if cur_acc < acc:
		if cur_lut == lut:
			good.pop()
		cur_lut = lut
		cur_acc = acc
		good.append([lut,acc,num])
for d in good:
	lut, acc, t = d
	c = (1-t/LL,0,t/LL)
	#c = (1,0,0)
	print(t)
	plt.plot(int(lut),1-float(acc),marker=".",color=c)
o_file = "./result_good.txt"
with open(o_file,"w") as f:
	print(good,file=f)
	for g in good:
		lut, acc, t =g
		print("{},{},{}".format(lut,acc,t),file=f)
print(good)
G = good

max_acc = 0
max_args = [0,0]
DATA = []
ORG_FLAG = True
org_acc = 0
org_bit = 0
result=[]
name_list = ["conv1_0.0_32","conv1_0.0_16", "conv1_0.5_16", "conv1_2.5_8", "conv1_3.0_8"]
CURRENT_DIR=["../all/"]
result_data()
circuit_acc = []
bit_list = []

LL = len(name_list)-1
for R in result:
	sumoflut,acc,c1  = R
	circuit = sumoflut
	#plt.plot(circuit,1-acc,marker=".",color=c)
	circuit_acc.append([circuit,acc,c1])
	bit_list.append([circuit,acc,c1])

plt.plot(12526594,1-0.6372999548912048,marker="x",color="black")
plt.xlabel("# of LUTs",fontsize=20)
plt.ylabel("Error",fontsize=20)
good = []
efficient = []
cur_acc = 0
cur_lut = 0
circuit_acc.sort()
for d in circuit_acc:
	lut, acc, c1 = d
	num = name_list.index(c1)
	if cur_acc < acc:
		if cur_lut == lut:
			good.pop()
		cur_lut = lut
		cur_acc = acc
		good.append([lut,acc,-num-1])
for d in good:
	lut, acc, t = d
	c = (0,0,1)
	#plt.plot(int(lut),1-float(acc),marker=".",color=c)
print(good)

G = G + good
G.sort()
good = []
cur_acc = 0
cur_lut = 0
for d in G:
	lut, acc, num = d
	if cur_acc < acc:
		if cur_lut == lut:
			good.pop()
		cur_lut = lut
		cur_acc = acc
		good.append([lut,acc,num])
for d in good:
	lut, acc, t = d
	c = (1,0,0) if t >= 0 else (0,0,1)
	#plt.plot(int(lut),1-float(acc),marker=".",color=c)

plt.show()
figure.savefig("result_c_{}.png".format(NAME[val]))