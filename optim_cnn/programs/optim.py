# coding: UTF-8

import torch
import torch.nn as nn
import torch.nn.functional as F
import torchvision.transforms as transforms
import torchvision
import numpy as np
import torch.optim as optim

from gurobipy import * 
import joblib
import modules
import sys
import os
import copy
import subprocess

mult_LUT = [[6, 0], [8, 2], [8, 2], [14, 2], [8, 2], [13, 2], [13, 2], [15, 2], [8, 2], [12, 2], [13, 2], [20, 2], [13, 2], [20, 2], [16, 2], [15, 2], [8, 2], [11, 2], [13, 2], [20, 2], [12, 2], [19, 2], [22, 2], [21, 2], [12, 2], [19, 2], [20, 2], [21, 2], [14, 2], [19, 2], [15, 2], [15, 2], [8, 2], [10, 2], [10, 2], [18, 2], [11, 2], [19, 2], [20, 2], [21, 2], [11, 2], [19, 2], [19, 2], [21, 2], [16, 2], [20, 2], [17, 2], [16, 2], [10, 2], [12, 2], [14, 2], [20, 2], [14, 2], [19, 2], [17, 2], [18, 2], [11, 2], [15, 2], [15, 2], [16, 2], [12, 2], [14, 2], [13, 2], [14, 2], [6, 0], [8, 2], [8, 2], [13, 2], [8, 2], [13, 2], [13, 2], [16, 2], [8, 2], [13, 2], [12, 2], [22, 2], [12, 2], [20, 2], [14, 2], [15, 2], [8, 2], [10, 2], [11, 2], [21, 2], [11, 2], [19, 2], [16, 2], [17, 2], [10, 2], [14, 2], [14, 2], [17, 2], [11, 2], [15, 2], [12, 2], [13, 2], [6, 0], [8, 2], [8, 2], [13, 2], [8, 2], [12, 2], [12, 2], [14, 2], [8, 2], [11, 2], [11, 2], [16, 2], [10, 2], [14, 2], [11, 2], [12, 2], [6, 0], [8, 2], [8, 2], [12, 2], [8, 2], [11, 2], [10, 2], [11, 2], [6, 0], [8, 2], [8, 2], [10, 2], [6, 0], [8, 2], [6, 0], [6, 0], [0, 0], [0, 0], [0, 0], [9, 2], [0, 0], [8, 2], [9, 2], [11, 2], [0, 0], [8, 2], [8, 2], [13, 2], [9, 2], [13, 2], [11, 2], [12, 2], [0, 0], [8, 2], [8, 2], [12, 2], [8, 2], [11, 2], [13, 2], [14, 2], [9, 2], [12, 2], [13, 2], [14, 2], [11, 2], [13, 2], [12, 2], [13, 2], [0, 0], [8, 2], [8, 2], [13, 2], [8, 2], [12, 2], [12, 2], [14, 2], [8, 2], [11, 2], [11, 2], [23, 2], [13, 2], [21, 2], [15, 2], [15, 2], [9, 2], [11, 2], [12, 2], [22, 2], [13, 2], [20, 2], [14, 2], [16, 2], [11, 2], [13, 2], [13, 2], [15, 2], [12, 2], [13, 2], [13, 2], [14, 2], [0, 0], [8, 2], [8, 2], [14, 2], [8, 2], [13, 2], [13, 2], [16, 2], [8, 2], [13, 2], [12, 2], [22, 2], [12, 2], [20, 2], [14, 2], [15, 2], [8, 2], [11, 2], [11, 2], [22, 2], [11, 2], [19, 2], [23, 2], [24, 2], [13, 2], [21, 2], [21, 2], [25, 2], [15, 2], [21, 2], [15, 2], [16, 2], [9, 2], [11, 2], [11, 2], [18, 2], [12, 2], [17, 2], [22, 2], [20, 2], [13, 2], [16, 2], [20, 2], [26, 2], [14, 2], [23, 2], [16, 2], [18, 2], [11, 2], [14, 2], [13, 2], [19, 2], [13, 2], [18, 2], [15, 2], [17, 2], [12, 2], [14, 2], [13, 2], [16, 2], [13, 2], [14, 2], [14, 2], [15, 2]]

device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
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

def bit_adder(x,bit_width):
	p = int(x)
	n = bit_width
	while p%2 == 0 and n != 0:
		p //= 2
		n -= 1
	n = 0 if n == 0 else n + bit_width
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

def to_int8(net_g):
    net_g.conv1.weight.data = (net_g.conv1.weight.data*128).to(torch.int8).to(torch.float16)/128
    net_g.conv2.weight.data = (net_g.conv2.weight.data*128).to(torch.int8).to(torch.float16)/128
    net_g.fc1.weight.data = (net_g.fc1.weight.data*128).to(torch.int8).to(torch.float16)/128
    net_g.fc2.weight.data = (net_g.fc2.weight.data*128).to(torch.int8).to(torch.float16)/128
    net_g.fc3.weight.data = (net_g.fc3.weight.data*128).to(torch.int8).to(torch.float16)/128

os.environ['CUDA_VISIBLE_DEVICES'] = '0'
transform = transforms.Compose(
    [transforms.ToTensor(),
     transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])
batch_size = 200
DL = False
train_set = torchvision.datasets.CIFAR10(root='~/workspace/auto_optim/datasets/', 
                                        train=True,
                                        download=DL,
                                        transform=transform)
train_loader = torch.utils.data.DataLoader(train_set,
                                            batch_size=batch_size,
                                            shuffle=True,
                                            num_workers=2)

test_set = torchvision.datasets.CIFAR10(root='~/workspace/auto_optim/datasets/', 
                                        train=False, 
                                        download=DL, 
                                        transform=transform)
test_loader = torch.utils.data.DataLoader(test_set, 
                                            batch_size=batch_size,
                                            shuffle=False, 
                                            num_workers=2)
classes = tuple(np.linspace(0, 9, 10, dtype=np.uint8))


args = sys.argv
args.pop(0)
WIDTH = 1
id = 0
val = 2
REC = False
CHILD = False
NAME_TAG = ""
val, WIDTH, REC, CHILD, NAME_TAG = modules.args_input(args,[["-l",val],["-w",WIDTH],["-r",REC],["-c",CHILD],["-n",NAME_TAG]])
if val > 4:
	exit()
NAME = ["conv1","conv2","fc1","fc2","fc3"]
print(NAME[val])

#WORK_DIR = "/work2/y-neo/workspace/auto_optim/"
WORK_DIR = "./"
DATA_DIR = "../data/"

#MODEL_HOME = "/work2/y-neo/workspace/auto_optim/data_flex"
MODEL_HOME = "."
if val == 0:
	model_name = "/model.pth"
else:
	model_name = "/model_retrained.pth"

print(model_name)


net = LeNet()
model_path = MODEL_HOME + model_name
net.load_state_dict(torch.load(model_path))

# to int8
net.conv1.weight.data = (net.conv1.weight.data*128).to(torch.int8).to(torch.float16)/128
net.conv2.weight.data = (net.conv2.weight.data*128).to(torch.int8).to(torch.float16)/128
net.fc1.weight.data = (net.fc1.weight.data*128).to(torch.int8).to(torch.float16)/128
net.fc2.weight.data = (net.fc2.weight.data*128).to(torch.int8).to(torch.float16)/128
net.fc3.weight.data = (net.fc3.weight.data*128).to(torch.int8).to(torch.float16)/128

net.to(device)
criterion = nn.CrossEntropyLoss()
optimizer = optim.SGD(net.parameters(), lr=0.001, momentum=0.9)
test_acc_org, test_loss_org = test(net, test_loader, criterion, torch.float16)

conv1 = net.conv1.weight.data * 128
conv2 = net.conv2.weight.data *128
fc1 = net.fc1.weight.data * 128
fc2 = net.fc2.weight.data * 128
fc3 = net.fc3.weight.data * 128

conv1 = conv1.flatten()
conv2 = conv2.flatten()
fc1 = fc1.flatten()
fc2 = fc2.flatten()
fc3 = fc3.flatten()
conv1_g = joblib.load("grad/conv1_grad")
conv1_g = nn.functional.normalize(conv1_g)
conv2_g = joblib.load("grad/conv2_grad")
conv2_g = nn.functional.normalize(conv2_g)
fc1_g = joblib.load("grad/fc1_grad")
fc1_g = nn.functional.normalize(fc1_g)
fc2_g = joblib.load("grad/fc2_grad")
fc2_g = nn.functional.normalize(fc2_g)
fc3_g = joblib.load("grad/fc3_grad")
fc3_g = nn.functional.normalize(fc3_g)
conv1_g = conv1_g.flatten()
conv1_g_abs = copy.deepcopy(conv1_g)
for i in range(len(conv1_g_abs)):
	conv1_g_abs[i] = abs(conv1_g_abs[i])
conv2_g = conv2_g.flatten()
conv2_g_abs = copy.deepcopy(conv2_g)
for i in range(len(conv2_g_abs)):
	conv2_g_abs[i] = abs(conv2_g_abs[i])
fc1_g = fc1_g.flatten()
fc1_g_abs = copy.deepcopy(fc1_g)
for i in range(len(fc1_g_abs)):
	fc1_g_abs[i] = abs(fc1_g_abs[i])
fc2_g = fc2_g.flatten()
fc2_g_abs = copy.deepcopy(fc1_g)
for i in range(len(fc2_g_abs)):
	fc2_g_abs[i] = abs(fc2_g_abs[i])
fc3_g = fc3_g.flatten()
fc3_g_abs = copy.deepcopy(fc1_g)
for i in range(len(fc3_g_abs)):
	fc3_g_abs[i] = abs(fc3_g_abs[i])

for i in range(len(conv1_g)):
	conv1_g[i] = 0 if math.isnan(conv1_g[i]) else conv1_g[i]
for i in range(len(conv2_g)):
	conv2_g[i] = 0 if math.isnan(conv2_g[i]) else conv2_g[i]
for i in range(len(fc1_g)):
	fc1_g[i] = 0 if math.isnan(fc1_g[i]) else fc1_g[i]
	fc1_g_abs[i] = 0 if math.isnan(fc1_g_abs[i]) else fc1_g_abs[i]
for i in range(len(fc2_g)):
	fc2_g[i] = 0 if math.isnan(fc2_g[i]) else fc2_g[i]
	fc2_g_abs[i] = 0 if math.isnan(fc2_g_abs[i]) else fc2_g_abs[i]
for i in range(len(fc3_g)):
	fc3_g[i] = 0 if math.isnan(fc3_g[i]) else fc3_g[i]
	fc3_g_abs[i] = 0 if math.isnan(fc3_g_abs[i]) else fc3_g_abs[i]

if val == 0:
	org_weight = conv1
if val == 1:
	org_weight = conv2
if val == 2:
	org_weight = fc1
if val == 3:
	org_weight = fc2
if val == 3:
	org_weight = fc3

# to int8
net.conv1.weight.data = (net.conv1.weight.data*128).to(torch.int8).to(torch.float16)/128
net.conv2.weight.data = (net.conv2.weight.data*128).to(torch.int8).to(torch.float16)/128
net.fc1.weight.data = (net.fc1.weight.data*128).to(torch.int8).to(torch.float16)/128
net.fc2.weight.data = (net.fc2.weight.data*128).to(torch.int8).to(torch.float16)/128
net.fc3.weight.data = (net.fc3.weight.data*128).to(torch.int8).to(torch.float16)/128


#model.Params.Threads = 8
c1_i = 3
c1_o = 6
c2_o = 16
fc1_in = 400
fc2_in = 128
fc3_in = 84
n_class = 10
f = 5
bit_width = 8

'''
A = [10,5,1,0.5,0.1,0.05,0.01]
B = [0,1,2,3,4,5,6,7,8]
W = [1,2,4,8,16,32,64,128]
'''

# A = [10,9,8,7,6,5,4,3,2,1.9,1.8,1.7,1.6,1.5,1.4,1.3,1.2,1.1,1,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0.05,0.01,0]

A = [0.0,0.5,1.0,1.5,2.0,2.5,3.0]
FLEX = [1,2,4,8,16,32] if val < 2 else [1,2,4,8,16]
layer = [0,0,0,0,0]
layer[val] = 1
OUT = [28*28,12*12,1,1,1]

for flex_range in FLEX:
	for a in A:
		flex = 1 + flex_range*2
		net = LeNet()
		model_path = MODEL_HOME + model_name
		net.load_state_dict(torch.load(model_path))
		net.to(device)
		id = "{}_{}".format(a,flex_range)
		print("ID:",id)
		name = NAME_TAG + NAME[val]+"_"+id
		if True:
			print(DATA_DIR+name+"/result_lut_"+NAME[val])
			if os.path.exists(DATA_DIR+name+"/result_lut_"+NAME[val]):
				continue
		w = []
		w_c1 = []
		w_c1_bit = []
		w_c2 = []
		w_c2_bit = []
		w_fc1 = []
		w_fc2 = []
		w_fc3 = []
		w_fc1_bit = []
		w_fc2_bit = []
		w_fc3_bit = []
		model = Model("LeNet")
		if not os.path.exists(DATA_DIR+name+"/"):
			os.mkdir(DATA_DIR+name+"/")

		if layer[0] == 1:
			for h in range(c1_o):
				for i in range(c1_i):
					for j in range(f):
						for k in range(f):
							tmp = []
							for l in range(flex):
								tmp.append(model.addVar(vtype=GRB.BINARY, name="conv1[%s][%s][%s][%s][%s]"%(h,i,j,k,l)))
							w_c1.append(tmp)
			for i in range(c1_i*c1_o*f*f):
				tmp = []
				for j in range(flex_range):
					val_j = max(conv1[i]-(flex_range-j),-128)
					tmp.append([val_j,bit_adder(val_j,8),conv1[i]-val_j,-1,mult_LUT[int(val_j)+128][0]])
				tmp.append([conv1[i],bit_adder(conv1[i],8),0,0,mult_LUT[int(conv1[i])+128][0]])
				for j in range(flex_range):
					val_j = min(conv1[i]+j+1,127)
					tmp.append([val_j,bit_adder(val_j,8),val_j-conv1[i],1,mult_LUT[int(val_j)+128][0]])
				w_c1_bit.append(tmp)
		if layer[1] == 1:
			for h in range(c2_o):
				for i in range(c1_o):
					for j in range(f):
						for k in range(f):
							tmp = []
							for l in range(flex):
								tmp.append(model.addVar(vtype=GRB.BINARY, name="conv2[%s][%s][%s][%s][%s]"%(h,i,j,k,l)))
							w_c2.append(tmp)
			for i in range(c1_o*c2_o*f*f):
				tmp = []
				for j in range(flex_range):
					val_j = max(conv2[i]-(flex_range-j),-128)
					tmp.append([val_j,bit_adder(val_j,8),conv2[i]-val_j,-1,mult_LUT[int(val_j)+128][0]])
				tmp.append([conv2[i],bit_adder(conv2[i],8),0,0,mult_LUT[int(conv2[i])+128][0]])
				for j in range(flex_range):
					val_j = min(conv2[i]+j+1,127)
					tmp.append([val_j,bit_adder(val_j,8),val_j-conv2[i],1,mult_LUT[int(val_j)+128][0]])
				w_c2_bit.append(tmp)

		if layer[2] == 1:
			for i in range(fc2_in):
				for j in range(fc1_in):
					tmp = []
					for l in range(flex):
						tmp.append(model.addVar(vtype=GRB.BINARY, name="fc1[%s][%s][%s][%s]"%(0,i,j,l)))
					w_fc1.append(tmp)
			for i in range(fc1_in*fc2_in):
				tmp = []
				for j in range(flex_range):
					val_j = max(fc1[i]-(flex_range-j),-128)
					tmp.append([val_j,bit_adder(val_j,8),fc1[i]-val_j,-1,mult_LUT[int(val_j)+128][0]])
				tmp.append([fc1[i],bit_adder(fc1[i],8),0,0,mult_LUT[int(fc1[i])+128][0]])
				for j in range(flex_range):
					val_j = min(fc1[i]+j+1,127)
					tmp.append([val_j,bit_adder(val_j,8),val_j-fc1[i],1,mult_LUT[int(val_j)+128][0]])
				w_fc1_bit.append(tmp)

		if layer[3] == 1:
			for i in range(fc3_in):
				for j in range(fc2_in):
					tmp = []
					for l in range(flex):
						tmp.append(model.addVar(vtype=GRB.BINARY, name="fc2[%s][%s][%s][%s]"%(0,i,j,l)))
					w_fc2.append(tmp)
			for i in range(fc2_in*fc3_in):
				tmp = []
				for j in range(flex_range):
					val_j = max(fc2[i]-(flex_range-j),-128)
					tmp.append([val_j,bit_adder(val_j,8),fc2[i]-val_j,-1,mult_LUT[int(val_j)+128][0]])
				tmp.append([fc2[i],bit_adder(fc2[i],8),0,0,mult_LUT[int(fc2[i])+128][0]])
				for j in range(flex_range):
					val_j = min(fc2[i]+j+1,127)
					tmp.append([val_j,bit_adder(val_j,8),val_j-fc2[i],1,mult_LUT[int(val_j)+128][0]])
				w_fc2_bit.append(tmp)

		if layer[4] == 1:
			for i in range(n_class):
				for j in range(fc3_in):
					tmp = []
					for l in range(flex):
						tmp.append(model.addVar(vtype=GRB.BINARY, name="fc3[%s][%s][%s][%s]"%(0,i,j,l)))
					w_fc3.append(tmp)
			for i in range(fc3_in*n_class):
				tmp = []
				for j in range(flex_range):
					val_j = max(fc3[i]-(flex_range-j),-128)
					tmp.append([val_j,bit_adder(val_j,8),fc3[i]-val_j,-1,mult_LUT[int(val_j)+128][0]])
				tmp.append([fc3[i],bit_adder(fc3[i],8),0,0,mult_LUT[int(fc3[i])+128][0]])
				for j in range(flex_range):
					val_j = min(fc3[i]+j+1,127)
					tmp.append([val_j,bit_adder(val_j,8),val_j-fc3[i],1,mult_LUT[int(val_j)+128][0]])
				w_fc3_bit.append(tmp)

		model.update()
		model_constr = []
		if layer[0] == 1:
			for i in range(c1_i*c1_o*f*f):
				model_constr.append(model.addConstr(quicksum(w_c1[i][j] for j in range(flex)) == 1 , name = "conv1_constr[%s]"%i))

		if layer[1] == 1:
			for i in range(c2_o*c1_o*f*f):
				model_constr.append(model.addConstr(quicksum(w_c2[i][j] for j in range(flex)) == 1, name = "conv2_constr[%s]"%i))

		if layer[2] == 1:
			for i in range(fc1_in*fc2_in):
				model_constr.append(model.addConstr(quicksum(w_fc1[i][j] for j in range(flex)) == 1, name = "fc1_constr[%s]"%i))

		if layer[3] == 1:
			for i in range(fc2_in*fc3_in):
				model_constr.append(model.addConstr(quicksum(w_fc2[i][j] for j in range(flex)) == 1, name = "fc2_constr[%s]"%i))

		if layer[4] == 1:
			for i in range(fc3_in*n_class):
				model_constr.append(model.addConstr(quicksum(w_fc3[i][j] for j in range(flex)) == 1, name = "fc3_constr[%s]"%i))


		if layer[0] == 1:
			model.setObjective(quicksum(quicksum(w_c1_bit[i][j][1]*w_c1[i][j] for j in range(flex))  for i in range(c1_i*c1_o*f*f)) \
			+ a * quicksum(quicksum(w_c1_bit[i][j][2]*conv1_g_abs[i]*w_c1[i][j] for j in range(flex)) for i in range(c1_i*c1_o*f*f)) \
			- a * quicksum(quicksum(w_c1_bit[i][j][3]*conv1_g[i]*w_c1[i][j] for j in range(flex)) for i in range(c1_i*c1_o*f*f)) \
			+ quicksum(quicksum(w_c1_bit[i][j][4]*w_c1[i][j] for j in range(flex)) for i in range(c1_i*c1_o*f*f)),GRB.MINIMIZE)

		if layer[1] == 1:
			model.setObjective(quicksum(quicksum(w_c2_bit[i][j][1]*w_c2[i][j] for j in range(flex))  for i in range(c2_o*c1_o*f*f)) \
			+ a * quicksum(quicksum(w_c2_bit[i][j][2]*conv2_g_abs[i]*w_c2[i][j] for j in range(flex)) for i in range(c2_o*c1_o*f*f)) \
			- a * quicksum(quicksum(w_c2_bit[i][j][3]*conv2_g[i]*w_c2[i][j] for j in range(flex)) for i in range(c2_o*c1_o*f*f)) \
			+ quicksum(quicksum(w_c2_bit[i][j][4]*w_c2[i][j] for j in range(flex)) for i in range(c2_o*c1_o*f*f)),GRB.MINIMIZE)
			#model.setObjective(quicksum(quicksum(w_c2_bit[i][j][1]*w_c2[i][j] for j in range(3))  for i in range(c2_o*c1_o*f*f)) - a * quicksum(quicksum((w_c2_bit[i][j][0]-conv2[i])*conv2_g[i]*w_c2[i][j] for j in range(3)) for i in range(c2_o*c1_o*f*f)),GRB.MINIMIZE)

		if layer[2] == 1:
			model.setObjective(quicksum(quicksum(w_fc1_bit[i][j][1]*w_fc1[i][j] for j in range(flex))  for i in range(fc1_in*fc2_in)) \
			+ a * quicksum(quicksum(w_fc1_bit[i][j][2]*fc1_g_abs[i]*w_fc1[i][j] for j in range(flex)) for i in range(fc1_in*fc2_in)) \
			- a * quicksum(quicksum(w_fc1_bit[i][j][3]*fc1_g[i]*w_fc1[i][j] for j in range(flex)) for i in range(fc1_in*fc2_in)) \
			+ quicksum(quicksum(w_fc1_bit[i][j][4]*w_fc1[i][j] for j in range(flex)) for i in range(fc1_in*fc2_in)),GRB.MINIMIZE)
			#model.setObjective(quicksum(quicksum(w_fc1_bit[i][j][1]*w_fc1[i][j] for j in range(3))  for i in range(fc1_in*fc2_in)) - a * quicksum(quicksum((w_fc1_bit[i][j][0]-fc1[i])*fc1_g[i]*w_fc1[i][j] for j in range(3)) for i in range(fc1_in*fc2_in)),GRB.MINIMIZE)

		if layer[3] == 1:
			model.setObjective(quicksum(quicksum(w_fc2_bit[i][j][1]*w_fc2[i][j] for j in range(flex))  for i in range(fc2_in*fc3_in)) \
			+ a * quicksum(quicksum(w_fc2_bit[i][j][2]*fc2_g_abs[i]*w_fc2[i][j] for j in range(flex)) for i in range(fc2_in*fc3_in)) \
			- a * quicksum(quicksum(w_fc2_bit[i][j][3]*fc2_g[i]*w_fc2[i][j] for j in range(flex)) for i in range(fc2_in*fc3_in)) \
			+ quicksum(quicksum(w_fc2_bit[i][j][4]*w_fc2[i][j] for j in range(flex)) for i in range(fc2_in*fc3_in)),GRB.MINIMIZE)
			#model.setObjective(quicksum(quicksum(w_fc2_bit[i][j][1]*w_fc2[i][j] for j in range(3))  for i in range(fc2_in*fc3_in)) - a * quicksum(quicksum((w_fc2_bit[i][j][0]-fc2[i])*fc2_g[i]*w_fc2[i][j] for j in range(3)) for i in range(fc2_in*fc3_in)) - quicksum(w_fc2[i][1] for i in range(fc2_in*fc3_in)),GRB.MINIMIZE)

		if layer[4] == 1:
			model.setObjective(quicksum(quicksum(w_fc3_bit[i][j][1]*w_fc3[i][j] for j in range(flex))  for i in range(fc3_in*n_class)) \
			+ a * quicksum(quicksum(w_fc3_bit[i][j][2]*fc3_g_abs[i]*w_fc3[i][j] for j in range(flex)) for i in range(fc3_in*n_class)) \
			- a * quicksum(quicksum(w_fc3_bit[i][j][3]*fc3_g[i]*w_fc3[i][j] for j in range(flex)) for i in range(fc3_in*n_class)) \
			+ quicksum(quicksum(w_fc3_bit[i][j][4]*w_fc3[i][j] for j in range(flex)) for i in range(fc3_in*n_class)),GRB.MINIMIZE)
			#model.setObjective(quicksum(quicksum(w_fc3_bit[i][j][1]*w_fc3[i][j] for j in range(3))  for i in range(fc3_in*n_class)) - a * quicksum(quicksum((w_fc3_bit[i][j][0]-fc3[i])*fc3_g[i]*w_fc3[i][j] for j in range(3)) for i in range(fc3_in*n_class))- quicksum(w_fc3[i][1] for i in range(fc3_in*n_class)),GRB.MINIMIZE)

		model.optimize()

		E = []

		if layer[0] == 1:
			exp = []
			tmp = []
			tmp2 = []
			tmp3 = []
			NumofLUT = 0
			NumofLUT_org = 0
			Bit = 0
			Bit_org = 0
			err = 0
			for i in range(c1_i*c1_o*f*f):
				selected = 0
				o_file_name = DATA_DIR+name+"/quantize.txt"
				o_file = open(o_file_name,"a")
				for j in range(flex):
					selected += int(w_c1[i][j].X)*j
				for j in range(flex):
					o_file.write("{} ".format(int(w_c1[i][j].X)))
				for j in range(flex):
					o_file.write("{} ".format(int(w_c1_bit[i][j][1])))
				o_file.write("  {}\n\n".format(conv1_g[i]))
				o_file.write("{} {}\n".format(int(conv1[i]), int(w_c1_bit[i][selected][0])))
				o_file.write("{} {}\n".format(w_c1_bit[i][flex_range][2]*conv1_g_abs[i]*w_c1[i][flex_range], w_c1_bit[i][selected][2]*conv1_g_abs[i]*w_c1[i][selected]))
				o_file.write("{} {}\n".format(w_c1_bit[i][flex_range][3]*conv1_g[i]*w_c1[i][flex_range],w_c1_bit[i][selected][3]*conv1_g[i]*w_c1[i][selected] ))
				o_file.write("{} {}\n\n".format(int(w_c1_bit[i][flex_range][4]), int(w_c1_bit[i][selected][4])))

				tmp.append(float(int(w_c1_bit[i][selected][0]))/128)
				err += int(abs(w_c1_bit[i][selected][0] -float(conv1[i])))
				Bit += w_c1_bit[i][selected][1]
				Bit_org += w_c1_bit[i][flex_range][1]
				NumofLUT += w_c1_bit[i][selected][4]
				NumofLUT_org += w_c1_bit[i][flex_range][4]
				if i%f == f-1:
					tmp2.append(tmp)
					tmp = []
				if i%(f*f) == f*f-1:
					tmp3.append(tmp2)
					tmp2 = []
				if i%(c1_i*f*f) == c1_i*f*f-1:
					exp.append(tmp3)
					tmp3 = []


		if layer[1] == 1:
			exp = []
			tmp = []
			tmp2 = []
			tmp3 = []
			Bit = 0
			Bit_org = 0
			err = 0
			NumofLUT = 0
			NumofLUT_org = 0
			for i in range(c2_o*c1_o*f*f):
				selected = 0
				o_file_name = DATA_DIR+name+"/quantize.txt"
				o_file = open(o_file_name,"a")
				for j in range(flex):
					selected += int(w_c2[i][j].X)*j
				for j in range(flex):
					o_file.write("{} ".format(int(w_c2[i][j].X)))
				o_file.write("\n")
				o_file.write("{} {}\n".format(int(conv2[i]), int(w_c2_bit[i][selected][0])))
				o_file.write("{} {}\n".format(w_c2_bit[i][flex_range][2]*conv2_g_abs[i]*w_c2[i][flex_range], w_c2_bit[i][selected][2]*conv2_g_abs[i]*w_c2[i][selected]))
				o_file.write("{} {}\n".format(w_c2_bit[i][flex_range][3]*conv2_g[i]*w_c2[i][flex_range],w_c2_bit[i][selected][3]*conv2_g[i]*w_c2[i][selected] ))
				o_file.write("{} {}\n".format(int(w_c2_bit[i][flex_range][4]), int(w_c2_bit[i][selected][4])))
				
				for j in range(flex):
					o_file.write("{} ".format(int(w_c2_bit[i][j][1])))
				o_file.write("  {}\n\n".format(conv2_g[i]))
				tmp.append(float(int(w_c2_bit[i][selected][0]))/128)
				err += int(abs(w_c2_bit[i][selected][0] -float(conv2[i])))
				Bit += w_c2_bit[i][selected][1]
				Bit_org += w_c2_bit[i][flex_range][1]
				NumofLUT += w_c2_bit[i][selected][4]
				NumofLUT_org += w_c2_bit[i][flex_range][4]
				if i%f == f-1:
					tmp2.append(tmp)
					tmp = []
				if i%(f*f) == f*f-1:
					tmp3.append(tmp2)
					tmp2 = []
				if i%(c1_o*f*f) == c1_o*f*f-1:
					exp.append(tmp3)
					tmp3 = []

		if layer[2] == 1:
			exp = []
			tmp = []
			Bit = 0
			Bit_org = 0
			err = 0
			NumofLUT = 0
			NumofLUT_org = 0
			for i in range(fc1_in*fc2_in):
				selected = 0
				o_file_name = DATA_DIR+name+"/quantize.txt"
				o_file = open(o_file_name,"a")
				for j in range(flex):
					selected += int(w_fc1[i][j].X)*j
				for j in range(flex):
					o_file.write("{} ".format(int(w_fc1[i][j].X)))
				o_file.write("\n")
				o_file.write("{} {}\n".format(int(fc1[i]), int(w_fc1_bit[i][selected][0])))
				o_file.write("{} {}\n".format(w_fc1_bit[i][flex_range][2]*fc1_g_abs[i]*w_fc1[i][flex_range], w_fc1_bit[i][selected][2]*fc1_g_abs[i]*w_fc1[i][selected]))
				o_file.write("{} {}\n".format(w_fc1_bit[i][flex_range][3]*fc1_g[i]*w_fc1[i][flex_range],w_fc1_bit[i][selected][3]*fc1_g[i]*w_fc1[i][selected] ))
				o_file.write("{} {}\n".format(int(w_fc1_bit[i][flex_range][4]), int(w_fc1_bit[i][selected][4])))
				for j in range(flex):
					o_file.write("{} ".format(int(w_fc1_bit[i][j][1])))
				o_file.write("  {}\n\n".format(fc1_g[i]))
				tmp.append(float(int(w_fc1_bit[i][selected][0]))/128)
				err += int(abs(w_fc1_bit[i][selected][0] -float(fc1[i])))
				Bit += w_fc1_bit[i][selected][1]
				Bit_org += w_fc1_bit[i][flex_range][1]
				NumofLUT += w_fc1_bit[i][selected][4]
				NumofLUT_org += w_fc1_bit[i][flex_range][4]
				if i%(fc1_in) == fc1_in-1:
					exp.append(tmp)
					tmp = []


		if layer[3] == 1:
			exp = []
			tmp = []
			Bit = 0
			Bit_org = 0
			err = 0
			NumofLUT = 0
			NumofLUT_org = 0
			for i in range(fc2_in*fc3_in):
				selected = 0
				o_file_name = DATA_DIR+name+"/quantize.txt"
				o_file = open(o_file_name,"a")
				for j in range(flex):
					selected += int(w_fc2[i][j].X)*j
				for j in range(flex):
					o_file.write("{} ".format(int(w_fc2[i][j].X)))
				o_file.write("\n")
				o_file.write("{} {}\n".format(int(fc2[i]), int(w_fc2_bit[i][selected][0])))
				o_file.write("{} {}\n".format(w_fc2_bit[i][flex_range][2]*fc2_g_abs[i]*w_fc2[i][flex_range], w_fc2_bit[i][selected][2]*fc2_g_abs[i]*w_fc2[i][selected]))
				o_file.write("{} {}\n".format(w_fc2_bit[i][flex_range][3]*fc2_g[i]*w_fc2[i][flex_range],w_fc2_bit[i][selected][3]*fc2_g[i]*w_fc2[i][selected] ))
				o_file.write("{} {}\n".format(int(w_fc2_bit[i][flex_range][4]), int(w_fc2_bit[i][selected][4])))
				for j in range(flex):
					o_file.write("{} ".format(int(w_fc2_bit[i][j][1])))
				o_file.write("  {}\n\n".format(fc2_g[i]))
				tmp.append(float(int(w_fc2_bit[i][selected][0]))/128)
				err += int(abs(w_fc2_bit[i][selected][0] -float(fc2[i])))
				Bit += w_fc2_bit[i][selected][1]
				Bit_org += w_fc2_bit[i][flex_range][1]
				NumofLUT += w_fc2_bit[i][selected][4]
				NumofLUT_org += w_fc2_bit[i][flex_range][4]
				if i%(fc2_in) == fc2_in-1:
					exp.append(tmp)
					tmp = []

		if layer[4] == 1:
			exp = []
			tmp = []
			Bit = 0
			Bit_org = 0
			err = 0
			NumofLUT = 0
			NumofLUT_org = 0
			for i in range(fc3_in*n_class):
				selected = 0
				
				o_file_name = DATA_DIR+name+"/quantize.txt"
				o_file = open(o_file_name,"a")
				for j in range(flex):
					selected += int(w_fc3[i][j].X)*j
				for j in range(flex):
					o_file.write("{} ".format(int(w_fc3[i][j].X)))
				o_file.write("\n")
				o_file.write("{} {}\n".format(int(fc3[i]), int(w_fc3_bit[i][selected][0])))
				o_file.write("{} {}\n".format(w_fc3_bit[i][flex_range][2]*fc3_g_abs[i]*w_fc3[i][flex_range], w_fc3_bit[i][selected][2]*fc3_g_abs[i]*w_fc3[i][selected]))
				o_file.write("{} {}\n".format(w_fc3_bit[i][flex_range][3]*fc3_g[i]*w_fc3[i][flex_range],w_fc3_bit[i][selected][3]*fc3_g[i]*w_fc3[i][selected] ))
				o_file.write("{} {}\n".format(int(w_fc3_bit[i][flex_range][4]), int(w_fc3_bit[i][selected][4])))
				for j in range(flex):
					o_file.write("{} ".format(int(w_fc3_bit[i][j][1])))
				o_file.write("  {}\n\n".format(fc3_g[i]))
				tmp.append(float(int(w_fc3_bit[i][selected][0]))/128)
				err += int(abs(w_fc3_bit[i][selected][0] -float(fc3[i])))
				Bit += w_fc3_bit[i][selected][1]
				Bit_org += w_fc3_bit[i][flex_range][1]
				NumofLUT += w_fc3_bit[i][selected][4]
				NumofLUT_org += w_fc3_bit[i][flex_range][4]
				if i%(fc3_in) == fc3_in-1:
					exp.append(tmp)
					tmp = []

		joblib.dump(exp, DATA_DIR+name+"/"+NAME[val]+".dat",compress=3)


		o_file = DATA_DIR+name+"/result_org"
		o_file = open(o_file,"w")
		o_file.write("acc_org = "+str(float(test_acc_org))+"\n")
		o_file.write("lut_org = "+str(Bit_org+NumofLUT_org)+"\n")
		o_file.write("bit = "+str(Bit)+"\n")
		o_file.close()
		o_file = DATA_DIR+name+"/result_lut_"+NAME[val]
		o_file = open(o_file,"w")
		o_file.write("lut = "+str(Bit+NumofLUT)+"\n")
		o_file.write("lut_layer = "+str((Bit+NumofLUT)*OUT[val])+"\n")
		o_file.close()