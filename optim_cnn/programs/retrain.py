# coding: UTF-8

import torch
import torch.nn as nn
import torch.nn.functional as F
import torchvision.transforms as transforms
import torchvision
import numpy as np
import torch.optim as optim

import joblib
import modules
import sys
import os
import copy
import subprocess
import time
import shutil
import math

class LeNet(nn.Module):
    def __init__(self):
        super(LeNet, self).__init__()
        self.conv1 = nn.Conv2d(3, 6, (5,5), bias = None)
        self.conv2 = nn.Conv2d(6, 16, (5,5), bias = None)
        self.fc1   = nn.Linear(16*5*5, 128, bias = None)
        self.fc2   = nn.Linear(128, 84, bias = None)
        self.fc3   = nn.Linear(84, 10, bias = None)
    def forward(self, x):
        x = F.max_pool2d(F.relu(self.conv1(x)), (2,2))
        x = F.max_pool2d(F.relu(self.conv2(x)), (2,2))
        x = x.view(-1, self.num_flat_features(x))
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x
    def num_flat_features(self, x):
        size = x.size()[1:]
        num_features = 1
        for s in size:
            num_features *= s
        return num_features


def bit_m(x, maxn):
	p = 0
	n = 0
	while abs(p-x) > (2**(1-maxn)):
		n += 1
		if p > x:
			p -= 2**(-n)
		else:
			p += 2**(-n)
	return n
def bit(x,maxn):
	p = int(x)
	n = maxn
	while p%2 == 0 and n != 0:
		p //= 2
		n -= 1
	return n

def binary_val(w, n):
	sum = -w[0]
	for i in range(1,n):
		sum += w[i]/(2**i)
	return sum
def BIT_W(w,maxn):
	n = maxn
	while n != 0 and w[n-1] == 0 :
		n -= 1
	return n

def test(net, test_loader, criterion, dtype=torch.float32):
    test_acc = 0
    test_loss = 0
    net.eval()
    with torch.no_grad():
        for data in test_loader:
            inputs, labels = data[0].to(device), data[1].to(device)
            inputs = inputs.to(dtype)
            outputs = net(inputs)
            loss = criterion(outputs, labels)
            test_loss += loss.item()/len(test_loader)
            acc = (outputs.argmax(dim=1) == labels).float().mean()
            test_acc += acc/len(test_loader)
    return test_acc, test_loss

def test_grad(net, test_loader, train_loader, criterion, dtype=torch.float32):
	test_acc = 0
	test_loss = 0
	net.eval()
	with torch.no_grad():
		for data in test_loader:
			inputs, labels = data[0].to(device), data[1].to(device)
			inputs = inputs.to(dtype)
			outputs = net(inputs)
			loss = criterion(outputs, labels)
			test_loss += loss.item()/len(test_loader)
			acc = (outputs.argmax(dim=1) == labels).float().mean()
			test_acc += acc/len(test_loader)
	net.train()
	for data in train_loader:
		inputs, labels = data[0].to(device), data[1].to(device)
		optimizer.zero_grad()
		inputs = inputs.to(dtype)
		outputs = net(inputs)
		loss = criterion(outputs, labels)
		loss.backward()
	return test_acc, test_loss

def gen_grad(net, test_loader, train_loader, criterion, dtype=torch.float32):
	test_acc = 0
	test_loss = 0
	net.train()
	for data in train_loader:
		inputs, labels = data[0].to(device), data[1].to(device)
		optimizer.zero_grad()
		inputs = inputs.to(dtype)
		outputs = net(inputs)
		loss = criterion(outputs, labels)
		loss.backward()
	return 

def to_int8(net_g):
    net_g.conv1.weight.data = (net_g.conv1.weight.data*128).to(torch.int8).to(torch.float16)/128
    net_g.conv2.weight.data = (net_g.conv2.weight.data*128).to(torch.int8).to(torch.float16)/128
    net_g.fc1.weight.data = (net_g.fc1.weight.data*128).to(torch.int8).to(torch.float16)/128
    net_g.fc2.weight.data = (net_g.fc2.weight.data*128).to(torch.int8).to(torch.float16)/128
    net_g.fc3.weight.data = (net_g.fc3.weight.data*128).to(torch.int8).to(torch.float16)/128

args = sys.argv
args.pop(0)
WIDTH = 1
id = 0
val = 2
NEXT = False
ALL = False
FLAG = 0
NAME_TAG = ""
val, WIDTH, NEXT, ALL, FLAG, NAME_TAG = modules.args_input(args,[["-l",val],["-w",WIDTH],["-n",NEXT],["-a",ALL],["-f",FLAG],["-t",NAME_TAG]])

NAME = ["conv1","conv2","fc1","fc2","fc3"]
print(NAME[val])
#WORK_DIR = "/work2/y-neo/workspace/auto_optim/"
WORK_DIR = "./"

#MODEL_HOME = "/work2/y-neo/workspace/auto_optim/data_flex"
MODEL_HOME = "./"

if NEXT:
	for i in range(FLAG):
		tag_list.pop(0)
	time_count = 1
	while not os.path.exists("./cifar-10_"+NAME[val]):
		time.sleep(6)
		if time_count % 20 == 0:
			print("WAITING: ./cifar-10_"+NAME[val])
			time_count = 0
		time_count += 1
	os.chdir("./cifar-10_"+NAME[val])
	name_input = WORK_DIR + "name_list"
	i_file = open(name_input,"r")
	tag_list = i_file.readlines()
	i_file.close()
	for name_tag in tag_list:
		name = name_tag.rstrip("_\n")
		print(name)
		os.chdir(name)
		command = ["python3", "retrain.py", "-l", str(val+1),"-t",name_tag.rstrip("\n")]
		subprocess.call(command)
		os.chdir("..")
	if ALL:
		if val+1 == 4:
			exit()
		command = ["python3", "retrain.py", "-l", str(val+1), "-n", "-a"]
		subprocess.call(command)
	exit()


os.environ['CUDA_VISIBLE_DEVICES'] = '0'
transform = transforms.Compose(
    [transforms.ToTensor(),
     transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])
batch_size = 500
DL = False
train_set = torchvision.datasets.CIFAR10(root='~/work2/workspace/datasets/CIFAR-10', 
                                        train=True,
                                        download=DL,
                                        transform=transform)
train_loader = torch.utils.data.DataLoader(train_set,
                                            batch_size=batch_size,
                                            shuffle=True,
                                            num_workers=2)

test_set = torchvision.datasets.CIFAR10(root='~/work2/workspace/datasets/CIFAR-10', 
                                        train=False, 
                                        download=DL, 
                                        transform=transform)
test_loader = torch.utils.data.DataLoader(test_set, 
                                            batch_size=batch_size,
                                            shuffle=False, 
                                            num_workers=2)
classes = tuple(np.linspace(0, 9, 10, dtype=np.uint8))
device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

A = [0.0,0.5,1.0,1.5,2.0,2.5,3.0]
FLEX = [1,2,4,8,16,32] if val < 2 else [1,2,4,8,16]

layer = [0,0,0,0,0]
layer[val] = 1
c1_i = 3
c1_o = 6
c2_i = c1_o
c2_o = 16
fc1_in = 400
fc2_in = 128
fc3_in = 84
n_class = 10
f = 5
bit_width = 8


retrained = []
retrained_var = []

DATA_DIR = "../data/"
if val != 0:
	model_name = "model_retrained.pth"
else:
	model_name = "model.pth"
model_path = MODEL_HOME + model_name
net = LeNet()
net.to(device)
net.load_state_dict(torch.load(model_path))

for flex_range in FLEX:
	for a in A:
		id = "{}_{}".format(a,flex_range)
		name = NAME_TAG+NAME[val]+"_{}".format(id)
		print(name)
		if os.path.exists(DATA_DIR+name+"/result_r"):
			continue
		if os.path.exists(DATA_DIR+name+"/SAME"):
			continue
		sleep_count = 0
		while not os.path.exists(DATA_DIR+name+"/"+NAME[val]+".dat"):
			sleep_count %= 12
			if sleep_count == 0:
				print("sleep {}".format(id))
			sleep_count += 1
			time.sleep(5)
		optimed_data = joblib.load(DATA_DIR+name+"/"+NAME[val]+".dat")

		i_file = open(DATA_DIR+name+"/result_lut_"+NAME[val],"r")
		READ = i_file.readlines()
		i_file.close()
		lut = int(READ[0].split(" ")[2].rstrip("\n"))
		print(lut)
		same_lut = [i for i, x in enumerate(retrained) if x == lut]
		SAME = True
		if same_lut != []:
			for i in same_lut:
				SAME = True
				a_tmp, f_tmp = retrained_var[i]
				tmp_id = "{}_{}".format(a_tmp,f_tmp)
				tmp_name = NAME_TAG+NAME[val]+"_{}".format(tmp_id)
				tmp_data = joblib.load(DATA_DIR+tmp_name+"/"+NAME[val]+".dat")
				if val == 0:
					for h in range(c1_o):
						for i in range(c1_i):
							for j in range(f):
								for k in range(f):
									if SAME and int(float(tmp_data[h][i][j][k])*128) != int(float(optimed_data[h][i][j][k])*128):
										SAME = False
				if val == 1:
					for h in range(c2_o):
						for i in range(c2_i):
							for j in range(f):
								for k in range(f):
									if SAME and int(float(tmp_data[h][i][j][k])*128) != int(float(optimed_data[h][i][j][k])*128):
										SAME = False
				if val == 2:
					for i in range(fc2_in):
						for j in range(fc1_in):
							if SAME and int(float(tmp_data[i][j])*128) != int(float(optimed_data[i][j])*128):
								SAME = False
				if val == 3:
					for i in range(fc3_in):
						for j in range(fc2_in):
							if SAME and int(float(tmp_data[i][j])*128) != int(float(optimed_data[i][j])*128):
								SAME = False
				if val == 4:
					for i in range(n_class):
						for j in range(fc3_in):
							if SAME and int(float(tmp_data[i][j])*128) != int(float(optimed_data[i][j])*128):
								SAME = False
				if SAME:
					old_id = tmp_id
					print(old_id)
					break
		else:
			SAME = False

		if SAME:
			print("SAME")
			o_file = DATA_DIR+name+"/SAME"
			o_file = open(o_file,"w")
			o_file.write(old_id)
			o_file.close()
			continue

		model_path = MODEL_HOME + model_name
		net = LeNet()
		net.load_state_dict(torch.load(model_path))
		net.to(device)
		
		if val == 0:
			for h in range(c1_o):
				for i in range(c1_i):
					for j in range(f):
						for k in range(f):
							net.conv1.weight.data[h][i][j][k] = optimed_data[h][i][j][k]
		if val == 1:
			for h in range(c2_o):
				for i in range(c2_i):
					for j in range(f):
						for k in range(f):
							net.conv2.weight.data[h][i][j][k] = optimed_data[h][i][j][k]
		if val == 2:
			for i in range(fc2_in):
				for j in range(fc1_in):
					net.fc1.weight.data[i][j] = optimed_data[i][j]
		if val == 3:
			for i in range(fc3_in):
				for j in range(fc2_in):
					net.fc2.weight.data[i][j] = optimed_data[i][j]
		if val == 4:
			for i in range(n_class):
				for j in range(fc3_in):
					net.fc3.weight.data[i][j] = optimed_data[i][j]

		retrained.append(lut)
		retrained_var.append([a,flex_range])
		
		# to int8
		net.conv1.weight.data = (net.conv1.weight.data*128).to(torch.int8).to(torch.float16)/128
		net.conv2.weight.data = (net.conv2.weight.data*128).to(torch.int8).to(torch.float16)/128
		net.fc1.weight.data = (net.fc1.weight.data*128).to(torch.int8).to(torch.float16)/128
		net.fc2.weight.data = (net.fc2.weight.data*128).to(torch.int8).to(torch.float16)/128
		net.fc3.weight.data = (net.fc3.weight.data*128).to(torch.int8).to(torch.float16)/128

		criterion = nn.CrossEntropyLoss()
		optimizer = optim.SGD(net.parameters(), lr=0.001, momentum=0.9)
		q_acc, q_loss = test_grad(net, test_loader, train_loader, criterion, torch.float16)
		print(f'test acc. {q_acc:.4f} test loss {q_loss:.4f}')
		GRAD_PATH = DATA_DIR+name+"/grad/"
		if not os.path.exists(GRAD_PATH):
			os.mkdir(GRAD_PATH)
		joblib.dump(net.conv1.weight.grad, GRAD_PATH+"conv1_grad",compress=3)
		joblib.dump(net.conv2.weight.grad, GRAD_PATH+"conv2_grad",compress=3)
		joblib.dump(net.fc1.weight.grad, GRAD_PATH+"fc1_grad",compress=3)
		joblib.dump(net.fc2.weight.grad, GRAD_PATH+"fc2_grad",compress=3)
		joblib.dump(net.fc3.weight.grad, GRAD_PATH+"fc3_grad",compress=3)
		model_path = DATA_DIR+name+"/model_retrained.pth"
		torch.save(net.state_dict(), model_path)

		o_file = DATA_DIR+name+"/quant_acc"
		o_file = open(o_file,"w")
		o_file.write("{}".format(q_acc))
		o_file.close()
		if val == 4:
			continue

		criterion = nn.CrossEntropyLoss()
		optimizer = optim.SGD(net.parameters(), lr=0.001, momentum=0.9)

		epochs = 100
		net.conv1.weight.requires_grad = False
		if val > 0:
			net.conv2.weight.requires_grad = False
		if val > 1:
			net.fc1.weight.requires_grad = False
		if val > 2:
			net.fc2.weight.requires_grad = False
		max_acc = q_acc
		saturated = 0
		start_time = time.perf_counter()
		for epoch in range(epochs):
			epoch_train_loss = 0
			epoch_train_acc = 0
			epoch_test_loss = 0
			epoch_test_acc = 0
			net.train()
			for data in train_loader:
				inputs, labels = data[0].to(device), data[1].to(device)
				inputs = inputs.to(torch.float16)
				optimizer.zero_grad()
				outputs = net(inputs)
				loss = criterion(outputs, labels)
				loss.backward()
				optimizer.step()
				epoch_train_loss += loss.item()/len(train_loader)
				acc = (outputs.argmax(dim=1) == labels).float().mean()
				epoch_train_acc += acc/len(train_loader)
			to_int8(net)
			net.eval()
			epoch_test_acc, epoch_test_loss = test(net, test_loader, criterion, torch.float16)
			print(f'Epoch {epoch+1} : train acc. {epoch_train_acc:.4f} train loss {epoch_train_loss:.4f}')
			print(f'Epoch {epoch+1} : test acc. {epoch_test_acc:.4f} test loss {epoch_test_loss:.4f}')
			if max_acc < epoch_test_acc:
				saturated = 0
				max_acc = epoch_test_acc
				model_path = DATA_DIR+name+"/model_retrained.pth"
				torch.save(net.state_dict(), model_path)
				joblib.dump(net.conv1.weight.data, DATA_DIR+name+"/conv1.dat",compress=3)
				joblib.dump(net.conv2.weight.data, DATA_DIR+name+"/conv2.dat",compress=3)
				joblib.dump(net.fc1.weight.data, DATA_DIR+name+"/fc1.dat",compress=3)
				joblib.dump(net.fc2.weight.data, DATA_DIR+name+"/fc2.dat",compress=3)
				joblib.dump(net.fc3.weight.data, DATA_DIR+name+"/fc3.dat",compress=3)
				gen_grad(net, test_loader, train_loader, criterion, torch.float16)
				GRAD_PATH = DATA_DIR+name+"/grad/"
				joblib.dump(net.conv1.weight.grad, GRAD_PATH+"conv1_grad",compress=3)
				joblib.dump(net.conv2.weight.grad, GRAD_PATH+"conv2_grad",compress=3)
				joblib.dump(net.fc1.weight.grad, GRAD_PATH+"fc1_grad",compress=3)
				joblib.dump(net.fc2.weight.grad, GRAD_PATH+"fc2_grad",compress=3)
				joblib.dump(net.fc3.weight.grad, GRAD_PATH+"fc3_grad",compress=3)
			else:
				saturated += 1
				if saturated > 3:
					break
		end_time = time.perf_counter()
		print(f"elapsed time: {(end_time - start_time):.4f}sec")
		o_file = DATA_DIR+name+"/result_r"
		o_file = open(o_file,"w")
		o_file.write("retrained_acc = "+str(float(max_acc))+"\n")
		o_file.close()