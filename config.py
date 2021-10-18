#!/usr/bin/env python3.6.9
# coding: UTF-8

class Config:
	def __init__(self, config_file="config"):
		self.width, self.layer, self.input_shape, self.classes, self.act = self._load_config(config_file)
		self.conv, self.fc = self._network_analysis()

	def _shape(self, STRING):
		L = STRING.rstrip("\n").split(",")
		OUT = []
		for i in L:
			OUT.append(int(i))
		return OUT

	def _layer(self, STRING):
		L = STRING.rstrip("\n").split(",")
		OUT = []
		OUT.append(L[0])
		L.pop(0)
		for i in L:
			OUT.append(int(i))
		return OUT

	def _load_config(self, config_file):
		_NAME = ["LAYER","ACT","INPUT","CLASS","WIDTH"]
		width = 8
		layer = []
		input_shape = []
		classes = 10
		act = ""
		_data = open(config_file,"r").readlines()
		i = 0
		while i < len(_data):
			if _data[i].rstrip("\n") == _NAME[0]:
				i += 1
				while(_data[i] != "\n"):
					layer.append(self._layer(_data[i]))
					i += 1
			elif _data[i].rstrip("\n") == _NAME[1]:
				i += 1
				act = _data[i]
			elif _data[i].rstrip("\n") == _NAME[2]:
				i += 1
				input_shape = self._shape(_data[i])
			elif _data[i].rstrip("\n") == _NAME[3]:
				i += 1
				classes = int(_data[i])
			elif _data[i].rstrip("\n") == _NAME[4]:
				i += 1
				width = int(_data[i])
			i += 1
		return width, layer, input_shape, classes, act

	def _network_analysis(self):
		conv = False
		fc = False
		for l in self.layer:
			if l[0] == "conv":
				conv = True
			if l[0] == "fc":
				fc = True
		return conv, fc