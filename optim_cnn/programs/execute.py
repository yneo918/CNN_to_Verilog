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
	home = "/vlsilab2/y-neo/workspace/auto_optim/all"
	os.symlink(home+"/programs/allread.py",DIR_PATH+"/allread.py")
	os.symlink(home+"/programs/modules.py",DIR_PATH+"/modules.py")
	os.symlink(home+"/programs/optim.py",DIR_PATH+"/optim.py")
	os.symlink(home+"/programs/retrain.py",DIR_PATH+"/retrain.py")
	return

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
#A = [10,9,8,7,6,5,4,3,2,1.9,1.8,1.7,1.6,1.5,1.4,1.3,1.2,1.1,1,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0.05,0.01]

#A = [10,9,8,7,6,5,4,3,2,1.9,1.8,1.7,1.6,1.5,1.4,1.3,1.2,1.1,1,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0.05,0.01,0]
A = [0.0,0.5,1,1.5,2.0,2.5,3.0]
LUT = [1]
FLEX = [1,2,4,8,16]

if NEXT:
	name = NAME[val]+"_{}_{}_{}".format(A[len(A)-1],FLEX[len(FLEX)-1],LUT[len(LUT)-1])
	if val == 4 and os.path.exists("./data/"+name+"/quant_acc"):
		print("val == 4")
	else:
		print("WAIT: ./data/{}/better".format(name))
		time_count = 0
		while not os.path.exists("./data/"+name+"/better") and not os.path.exists("./data/"+name+"/SAME"):
			time.sleep(30)
			if time_count % 10 == 0:
				print("WAITING:./data/{}/better".format(name))
				time_count = 0
			time_count += 1

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
for f in FLEX:
	for a in A:
		for lut in LUT:
			name = NAME[val]+"_{}_{}_{}".format(a,f,lut)
			if os.path.exists("./data/"+name+"/SAME"):
				continue
			if BIT_ONLY:
				if not os.path.exists("./data/"+name+"/result_bit"):
					continue
				i_file = open("./data/"+name+"/result_bit","r")
				READ = i_file.read()
				i_file.close()
				bit = READ.split(" ")[2].rstrip("\n")
				DATA.append([int(bit),a,f,lut])
				o_file = open(o_name,"a")
				o_file.write("{},{},{},{}\n".format(a,f,lut,bit))
				o_file.close()
				continue
			if not os.path.exists("./data/"+name+"/result_r"):
				if val == 4 and CIRCUIT:
					i_file = open("./data/"+name+"/result_lut","r")
					READ = i_file.readlines()
					i_file.close()
					org_numoflut = int(READ[1].split(" ")[2].rstrip("\n"))
					numoflut = int(READ[0].split(" ")[2].rstrip("\n"))
					i_file = open("./data/"+name+"/result_bit","r")
					READ = i_file.read()
					i_file.close()
					bit = READ.split(" ")[2].rstrip("\n")
					i_file = open("./data/"+name+"/quant_acc","r")
					READ = i_file.read()
					i_file.close()
					q_acc = READ
					acc = q_acc
					if float(acc) > max_acc:
						max_acc = float(acc)
						max_args = [a,f,lut]
					if CIRCUIT:
						DATA.append([int(bit)+numoflut,float(acc),a,f,lut])
						o_name = "bit-acc_CIRCUIT.txt"
						o_file = open(o_name,"a")
						o_file.write("{},{},{},{},{},{}\n".format(a,f,lut,bit,numoflut,acc))
						o_file.close()
						x_y.append([int(bit)+numoflut,1-float(acc)])
						c = (A.index(a)/len(A)/2+0.3,A.index(a)/len(A)/2+0.3,A.index(a)/len(A)/2+0.3)
						plt.plot(int(bit)+numoflut,1-float(acc),marker="o",color=c)
				continue
			if ORG_FLAG:
				i_file = open("./data/"+name+"/result_org","r")
				READ = i_file.readlines()
				i_file.close()
				print("{},{},{}".format(a,f,lut))
				org_bit = int(READ[1].split(" ")[2].rstrip("\n"))
				org_acc = float(READ[0].split(" ")[2].rstrip("\n"))
				ORG_FLAG = False
			if CIRCUIT:
				i_file = open("./data/"+name+"/result_lut","r")
				READ = i_file.readlines()
				i_file.close()
				org_numoflut = int(READ[1].split(" ")[2].rstrip("\n"))
				numoflut = int(READ[0].split(" ")[2].rstrip("\n"))
			i_file = open("./data/"+name+"/result_r","r")
			READ = i_file.read()
			i_file.close()
			r_acc = READ.split(" ")[2].rstrip("\n")
			i_file = open("./data/"+name+"/result_bit","r")
			READ = i_file.read()
			i_file.close()
			bit = READ.split(" ")[2].rstrip("\n")
			i_file = open("./data/"+name+"/quant_acc","r")
			READ = i_file.read()
			i_file.close()
			q_acc = READ
		
			acc = q_acc if Q_ONLY or float(q_acc) > float(r_acc) else r_acc
			if float(acc) > max_acc:
				max_acc = float(acc)
				max_args = [a,f,lut]
			if CIRCUIT:
				DATA.append([int(bit)+numoflut,float(acc),a,f,lut])
				o_name = "bit-acc_CIRCUIT.txt"
				o_file = open(o_name,"a")
				o_file.write("{},{},{},{},{},{}\n".format(a,f,lut,bit,numoflut,acc))
				o_file.close()
				x_y.append([int(bit)+numoflut,1-float(acc)])
				c = (A.index(a)/len(A)/2+0.3,A.index(a)/len(A)/2+0.3,A.index(a)/len(A)/2+0.3)
				plt.plot(int(bit)+numoflut,1-float(acc),marker="o",color=c)
			else:
				DATA.append([int(bit),float(acc),a,f,lut])
				o_file = open(o_name,"a")
				o_file.write("{},{},{},{},{}\n".format(a,f,lut,bit,acc))
				o_file.close()
				x_y.append([int(bit),1-float(acc)])
				c = (A.index(a)/len(A)/2+0.3,A.index(a)/len(A)/2+0.3,A.index(a)/len(A)/2+0.3)
				plt.plot(int(bit),1-float(acc),marker="o",color=c)
if BIT_ONLY:
	exit()
if hline != 0.0:
	plt.hlines(0.38,0,25000,colors="green")
	plt.hlines(0.37,0,25000,colors="red")
	plt.hlines(0.36,0,25000,colors="blue")
if CIRCUIT:
	plt.plot(org_bit+org_numoflut,1-org_acc,marker="x",color="black")
	plt.xlabel("LUT",fontsize=20)
	print("{},{},{}".format(org_acc,org_bit,org_numoflut))
else:
	plt.plot(org_bit,1-org_acc,marker="x",color="black")
	plt.xlabel("Sum of Bit Width",fontsize=20)
	print("{},{}".format(org_acc,org_bit))
plt.ylabel("Error",fontsize=20)
#plt.ylim([0.36,0.4])
#plt.xlim([140000,142000])
if not Q_ONLY:
	print(max_acc)
	print(max_args)
	good = []
	efficient = []
	cur_acc = 0
	cur_bit = 0
	cur_efficient = 0 # bitあたりの精度 最低bitがなるだけ。
	DATA = sorted(DATA)
	for d in DATA:
		bit, acc, a, f, lut = d
		if cur_acc < acc:
			if cur_bit == bit:
				good.pop()
			cur_bit = bit
			cur_acc = acc
			good.append(d)
		if cur_efficient < acc/bit:
			cur_efficient = acc/bit
			efficient = d
	for d in good:
		bit, acc, a, f, lut = d
		c = (0,0,0)
		plt.plot(int(bit),1-float(acc),marker="+",color=c)
	print(good)
	print(good[0])
	print(good[len(good)//2])
	print(good[len(good)-1])

	next_val = [good[0]]
	if good[len(good)//2] != good[0]:
		next_val.append(good[len(good)//2])
	if good[len(good)//2] != good[len(good)-1]:
		next_val.append(good[len(good)-1])

	#print(efficient)
	if MAKE_NEXT:
		if not os.path.exists("./cifar-10_"+NAME[val]):
			os.mkdir("./cifar-10_"+NAME[val])
			o_file = "./cifar-10_"+NAME[val]+"/result_of_quantize.txt"
			with open(o_file,"w") as f:
				print(good,file=f)
				for g in next_val:
					print(g,file=f)
			o_file = "./cifar-10_"+NAME[val]+"/circuit_scale.csv"
			with open(o_file,"w") as f:
				for g in next_val:
					a,flex,lut = g[2:5]
					f.write("{},{},{}\n".format(a,flex,lut))
			link_pyfile('./cifar-10_'+NAME[val])
			for g in next_val:
				a,f,lut = g[2:5]
				name = NAME[val]+"_{}_{}_{}".format(a,f,lut)
				shutil.copytree("./data/"+name,"./cifar-10_"+NAME[val]+"/"+name)
				link_pyfile("./cifar-10_"+NAME[val]+"/"+name)
			
if not NEXT:
	plt.show()
if Q_ONLY:
	figure.savefig("img_bit-acc-c10_q.png")
elif CIRCUIT:
	figure.savefig("img_circuit-acc-.png")
else:
	figure.savefig("img_bit-acc-c10.png")
print(next_val)
if NEXT:
	if FLAG:
		next_val.pop(0)
		next_val.pop(0)
	for g in next_val:
		a,f,lut = g[2:5]
		name = NAME[val]+"_{}_{}_{}".format(a,f,lut)
		print(name)
		os.chdir("./cifar-10_"+NAME[val]+"/"+name)
		command = ["python3", "optim.py", "-l", str(val+1)]
		subprocess.call(command)
		os.chdir("../..")
	if ALL:
		if val == 4:
			exit()
		for g in next_val:
			a,f,lut = g[2:5]
			name = NAME[val]+"_{}_{}_{}".format(a,f,lut)
			print("ALL-NEXT:{}".format(name))
			os.chdir("./cifar-10_"+NAME[val]+"/"+name)
			command = ["python3", "allread.py", "-l", str(val+1), "-m", "-n", "-a", "-c"]
			subprocess.call(command)
			os.chdir("../..")