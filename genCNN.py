#!/usr/bin/env python3.6.9

import math
import sys
import joblib
import config
import genFc
import genConv
import genTop
import copy

class CnnToVerilog:
	WIDTH = 8
	LAYER = []
	INPUT_DATA_SHAPE = [1,28,28]
	def __init__(self, config_file="config_file"):
		self.config = config.Config(config_file)

	def gen_cnn(self):
		self.gen_top()
		if self.config.conv:
			self.gen_conv()
		if self.config.fc:
			self.gen_fc()
		_conv = 0
		_fc = 0
		_shape = copy.deepcopy(self.config.input_shape)
		for L in self.config.layer:
			if L[0] == "conv":
				_conv += 1
				self.gen_conv_layer(depth = _conv, H = _shape[2], W = _shape[1])
				_shape[0] = L[2]
				_shape[1] = _shape[1] - (L[3] - 1)
				_shape[2] = _shape[2] - (L[3] - 1)
			if L[0] == "maxpool":
				_shape[1] = _shape[1] // 2
				_shape[2] = _shape[2] // 2
			if L[0] == "fc":
				_fc += 1
				self.gen_fc_layer(depth = _fc)

	def gen_fc_layer(self, depth=1):
		d = self.find_layer(layer="fc", depth=depth)
		genFc.generate_fc_layer(WIDTH = self.config.width, IN = self.config.layer[d][1], OUT = self.config.layer[d][2], l=d+1, i_file_name = "fc"+str(depth)+".dat")
		genFc.generate_fc_layer_tb(WIDTH = self.config.width, IN = self.config.layer[d][1], OUT = self.config.layer[d][2], l=d+1, i_file_name = "fc"+str(depth)+".dat")
	
	def gen_fc(self):
		genFc.generate_fc(self.config)

	def gen_conv_layer(self, depth=1, H = 28, W = 28):
		d = self.find_layer(layer="conv", depth=depth)
		genConv.generate_conv_layer(config, WIDTH = self.config.width, cin = self.config.layer[d][1], cout = self.config.layer[d][2], F = self.config.layer[d][3], H=H, W=W, l=d+1, i_file_name = "conv"+str(depth)+".dat")
	
	def gen_conv(self):
		genConv.generate_conv(self.config)

	def gen_top(self):
		genTop.generate_top(self.config)

	def find_layer(self, layer="fc", depth=1):
		c = 0
		d = 0
		for l in self.config.layer:
			if l[0] == layer:
				c += 1
				if c == depth:
					return d
			d += 1



CNN = CnnToVerilog()
CNN.gen_cnn()