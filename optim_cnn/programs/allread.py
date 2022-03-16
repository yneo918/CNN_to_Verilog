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

def link_pyfile(DIR_PATH):
	#絶対パスを記入
	#別のディレクトリでも実行するため
	home = "/vlsilab2/y-neo/workspace/auto_optim/second"
	if os.path.exists(DIR_PATH+"/allread.py"):
		return
	os.symlink(home+"/programs/allread.py",DIR_PATH+"/allread.py")
	os.symlink(home+"/programs/modules.py",DIR_PATH+"/modules.py")
	os.symlink(home+"/programs/optim.py",DIR_PATH+"/optim.py")
	os.symlink(home+"/programs/retrain.py",DIR_PATH+"/retrain.py")
	return

args = sys.argv
args.pop(0)
WIDTH = 8
Q_ONLY = False
BIT_ONLY = False
MAKE_NEXT = False
NEXT = False
ALL = False
FLAG = 0
hline = 0.0
val = 0
COLOR = False

# WIDTH is not used.
val, WIDTH, Q_ONLY, BIT_ONLY, MAKE_NEXT, hline, NEXT, ALL, FLAG, COLOR = modules.args_input(args,[["-l",val],["-w",WIDTH],["-q",Q_ONLY],["-b",BIT_ONLY],["-m",MAKE_NEXT],["-h",hline],["-n",NEXT],["-a",ALL],["-f",FLAG],["-c",COLOR]])

NAME = ["conv1","conv2","fc1","fc2","fc3"]
name_list = ["conv1_0.0_32","conv1_0.0_16", "conv1_0.5_16", "conv1_2.5_8", "conv1_3.0_8"]
print(NAME[val])
A = [0.0,0.5,1.0,1.5,2.0,2.5,3.0]
FLEX = [1,2,4,8,16,32] if val < 2 else [1,2,4,8,16]
DATA_DIR = "./data/"
WORK_DIR = "./"
LUT_ORGMODEL = [7313*28*28,40740*12*12,742375,170028,14239]
SUM_ORGMODEL = []
_tmp = 0
for i in LUT_ORGMODEL:
	_tmp += i
	SUM_ORGMODEL.append(_tmp)
ACC_ORGMODEL = 0.6372999548912048
ACC_THRESHOLD = 0.05


if NEXT:
	name = NAME[val]+"_{}_{}".format(A[len(A)-1],FLEX[len(FLEX)-1])
	if val == 4:
		print("val == 4")
		time_count = 1
		while not os.path.exists(DATA_DIR+name+"/quant_acc"):
			time.sleep(6)
			if time_count % 10 == 0:
				print("WAITING: {}/quant_acc".format(name))
				time_count = 0
			time_count += 1
	else:
		name_input = WORK_DIR + "name_list"
		i_file = open(name_input,"r")
		tag_list = i_file.readlines()
		i_file.close()
		name_tag = tag_list.pop().replace("\n","")
		name = name_tag + name
		print("WAIT: {}/result_r or SAME".format(name))
		time_count = 1
		while not os.path.exists(DATA_DIR+name+"/result_r") and not os.path.exists(DATA_DIR+name+"/SAME"):
			time.sleep(6)
			if time_count % 10 == 0:
				print("WAITING: {}/result_r".format(name))
				time_count = 0
			time_count += 1

figure = plt.figure()
DATA = []

name_input = WORK_DIR + "name_list"
i_file = open(name_input,"r")
tag_list = i_file.readlines()
i_file.close()

col = -1
wid = len(tag_list)-1
for tag in tag_list:
	col += 1
	upstream = 0
	name_tag = tag.replace("\n","")
	if name_tag == "" and len(tag_list) > 1:
		continue
	if val > 0:
		i_file = open(name_tag.rstrip("_")+"/result_lut","r")
		lut_list = i_file.readlines()
		i_file.close()
		for l in lut_list:
			upstream += int(l)
	o_name = "lut-acc_CIRCUIT.txt"
	o_file = open(o_name,"w")
	o_file.close()
	for f in FLEX:
		for a in A:
			name = name_tag+NAME[val]+"_{}_{}".format(a,f)
			if os.path.exists(DATA_DIR+name+"/SAME"):
				continue
			if not os.path.exists(DATA_DIR+name+"/result_r"):
				if val == 4:
					i_file = open(DATA_DIR+name+"/result_lut_"+NAME[val],"r")
					READ = i_file.readlines()
					i_file.close()
					numoflut = int(READ[0].split(" ")[2].rstrip("\n"))
					sumoflut = int(READ[1].split(" ")[2].rstrip("\n"))
					o_file = open(DATA_DIR+name+"/result_lut","w")
					o_file.writelines(lut_list)
					o_file.write("{}\n".format(sumoflut))
					i_file.close()
					i_file = open(DATA_DIR+name+"/quant_acc","r")
					READ = i_file.read()
					i_file.close()
					acc = READ
					DATA.append([sumoflut+upstream,float(acc),a,f,name])
					o_name = "lut-acc_CIRCUIT.txt"
					o_file = open(o_name,"a")
					o_file.write("{},{},{},{},{}\n".format(a,f,numoflut,sumoflut+upstream,acc))
					o_file.close()
					c = (0.5,0.5,0.5)
					plt.plot(sumoflut+upstream,1-float(acc),marker="o",color=c)
				continue
			i_file = open(DATA_DIR+name+"/result_lut_"+NAME[val],"r")
			READ = i_file.readlines()
			i_file.close()
			numoflut = int(READ[0].split(" ")[2].rstrip("\n"))
			sumoflut = int(READ[1].split(" ")[2].rstrip("\n"))
			i_file = open(DATA_DIR+name+"/result_r","r")
			READ = i_file.read()
			i_file.close()
			r_acc = READ.split(" ")[2].rstrip("\n")

			o_file = open(DATA_DIR+name+"/result_lut","w")
			if val > 0:
				o_file.writelines(lut_list)
			o_file.write("{}\n".format(sumoflut))
			i_file.close()
		
			acc = r_acc
			DATA.append([sumoflut+upstream,float(acc),a,f,name])
			o_name = "lut-acc_CIRCUIT.txt"
			o_file = open(o_name,"a")
			o_file.write("{},{},{},{},{}\n".format(a,f,numoflut,sumoflut+upstream,acc))
			o_file.close()
			c = (0.5,0.5,0.5)
			if COLOR:
				c = (1-col/wid,0,col/wid)
				plt.plot(sumoflut+upstream,1-float(acc),marker=".",color=c)
			else:
				plt.plot(sumoflut+upstream,1-float(acc),marker="o",color=c)
plt.plot(SUM_ORGMODEL[val],1-ACC_ORGMODEL,marker="x",color="black")
plt.xlabel("# of LUTs",fontsize=20)
print("{},{}".format(ACC_ORGMODEL,SUM_ORGMODEL[val]))
plt.ylabel("Error",fontsize=20)

good = []
cur_acc = -1
cur_lut = -1
DATA = sorted(DATA)
for d in DATA:
	lut, acc, a, flex, name = d
	if ACC_ORGMODEL-ACC_THRESHOLD < acc:
		if acc > cur_acc:
			if cur_lut == lut:
				good.pop()
			cur_lut = lut
			cur_acc = acc
			good.append(d)
		if acc > cur_acc - 0.002:
			good.append(d)
for d in good:
	lut, acc, a, flex, name = d
	c = (0,0,0)
	if not COLOR:
		plt.plot(int(lut),1-float(acc),marker="+",color=c)
print(good)
print(len(good))

next_val = good

if MAKE_NEXT:
	if not os.path.exists("./cifar-10_"+NAME[val]):
		os.mkdir("./cifar-10_"+NAME[val])
	o_file = "./cifar-10_"+NAME[val]+"/result_of_quantize.txt"
	with open(o_file,"w") as f:
		for g in next_val:
			print(g,file=f)
	o_file = "./cifar-10_"+NAME[val]+"/name_list"
	with open(o_file,"w") as f:
		for g in next_val:
			lut, acc, a, flex, name = g
			print(name+"_",file=f)
	link_pyfile('./cifar-10_'+NAME[val])
	for g in next_val:
		lut, acc, a, flex, name = g
		if not os.path.exists("./cifar-10_"+NAME[val]+"/"+name):
			shutil.copytree(DATA_DIR+name,"./cifar-10_"+NAME[val]+"/"+name)
		link_pyfile("./cifar-10_"+NAME[val]+"/"+name)
		
if not NEXT:
	plt.show()

if COLOR:
	figure.savefig("./cifar-10_"+NAME[val]+"/img_circuit-acc_"+NAME[val]+"_color.png")
else:
	figure.savefig("./cifar-10_"+NAME[val]+"/img_circuit-acc_"+NAME[val]+".png")

if NEXT:
	if not os.path.exists("./cifar-10_"+NAME[val]+"/data/"):
		os.mkdir("./cifar-10_"+NAME[val]+"/data")
	os.chdir("./cifar-10_"+NAME[val]+"/")
	for i in range(FLAG):
		next_val.pop(0)
	for g in next_val:
		lut, acc, a, f, name = g
		print(name)
		os.chdir(name)
		command = ["python3", "optim.py", "-l", str(val+1),"-n",name+"_"]
		subprocess.call(command)
		os.chdir("..")
	if ALL:
		if val == 4:
			exit()
		command = ["python3", "allread.py", "-l", str(val+1), "-m", "-n", "-a"]
		subprocess.call(command)