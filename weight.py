#!/usr/bin/env python3.6
# coding: UTF-8
import modules
import sys


# Conv
cin = 3
cout = 6
f = 5
tmp = []
tmp2 = []
tmp3 = []
weight = []

for i in range(cin*cout*f*f):
	if i%f == f-1:
		tmp2.append(tmp)
		tmp = []
	if i%(f*f) == f*f-1:
		tmp3.append(tmp2)
		tmp2 = []
	if i%(c1_i*f*f) == c1_i*f*f-1:
		weight.append(tmp3)
		tmp3 = []

joblib.dump(weight, "conv1.dat",compress=3)

# FC
IN = 400
OUT = 128
tmp = []
weight = []

for i in range(IN*OUT):
	if i%(IN) == IN-1:
		weight.append(tmp)
		tmp = []
		
joblib.dump(weight, "conv1.dat",compress=3)