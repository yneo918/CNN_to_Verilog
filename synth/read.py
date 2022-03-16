# coding: UTF-8

import subprocess
import sys
import os
import joblib
import math
import matplotlib.pyplot as plt
import numpy as np

NAME = ["conv1","conv2","fc1","fc2","fc3"]
WIDTH = 8
MAX_INDEX = []
cout = [6,16,128,84,10]
for val in range(5):
	max_time_index = 0
	f = open("result_detail_{}.txt".format(NAME[val]),"w")
	f.close()
	i = 0
	LUTs = 0
	CARRYs = 0
	max_time = 0
	for ch in range(cout[val]):
		name = "{}_{}".format(NAME[val],ch)
		print(name)
		i_file_name = "output/"+name+"/report/timing-summary.rpt"
		if not os.path.exists(i_file_name):
			continue
		with open(i_file_name,"r") as f:
			READ = f.readlines()
		TIME = READ[201].split(" ")[12].replace("ns","")
		time = float(TIME)
		print(TIME)
		with open("result_detail_{}.txt".format(NAME[val]),"a") as f:
			print(name,file=f)
			print("time={}".format(TIME),file=f)
		if max_time < time :
			max_time = time
			max_time_index = ch
	print("time={}".format(time))
	with open("result_detail_{}.txt".format(NAME[val]),"a") as f:
		print("max_time={}\n".format(max_time),file=f)
		#print("max_time={}\n".format(max_time))
	MAX_INDEX.append([max_time_index, max_time])

sum = 0
for index, time in MAX_INDEX:
	sum += time
	with open("result_detail.txt","a") as f:
		print("max_time={}\n".format(time),file=f)
		print("max_time={}\n".format(time))

with open("result_detail.txt","a") as f:
	print("sum_time={}\n".format(sum),file=f)