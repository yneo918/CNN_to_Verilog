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
	home = "."
	if os.path.exists(DIR_PATH+"/allread.py"):
		return
	os.symlink(home+"/programs/allread.py",DIR_PATH+"/allread.py")
	os.symlink(home+"/programs/modules.py",DIR_PATH+"/modules.py")
	os.symlink(home+"/programs/optim.py",DIR_PATH+"/optim.py")
	os.symlink(home+"/programs/retrain.py",DIR_PATH+"/retrain.py")
	return

link_pyfile("./")