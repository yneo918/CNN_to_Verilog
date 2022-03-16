# coding: UTF-8
import sys

'''
	input:
		args : 実行ファイル名を除いたargs
		arg_input : タグと初期値の組
	output:
		タグの順番に合わせた変数の組
	usage:
		import modules

		args = sys.argv
		args.pop(0)
		A = 1
		B = 2
		C = 3
		A, B, C = modules.args_input(args,[["-a",A],["-b",B],["-c",C]])
'''


def args_input(args, arg_input):
	count = 0
	VAR = []
	tag = []
	argc = len(args)

	for i in range(len(arg_input)):
		tag.append(arg_input[i][0])
		VAR.append(arg_input[i][1])

	while count < argc:
		if tag.count(args[count])>0:
			count += 1
			if type(VAR[tag.index(args[count-1])]) == bool:
				VAR[tag.index(args[count-1])] = True
				count -= 1
			else:
				VAR[tag.index(args[count-1])] = fit_type(type(VAR[tag.index(args[count-1])]),args[count])
		count += 1

	return VAR

def fit_type(input_type,input_val):
	if input_type == type(1):
		return int(input_val)
	elif input_type == type(0.1):
		return float(input_val)
	elif input_type == type([]):
		return list(input_val)
	elif input_type == type(""):
		return str(input_val)
	elif input_type == type(True):
		return bool(input_val)
	else:
		return input_val


'''
	To Binarize list
	ex)
		 17 -> [1,0,0,0,1]
		127 -> [1,1,1,1,1,1,1,1]
	bit wize : variable
'''
def binalized_list(x):
	i = x
	plus = True
	if i < 0:
		i = 256 + i
		plus = False
	LIST = []
	while i > 0:
		LIST.append(i%2)
		i //= 2
	if plus:
		LIST.append(0)
	LIST.reverse()
	return LIST

def nop():
	return 0

def prime_factorize(n):
    a = []
    while n % 2 == 0:
        a.append(2)
        n //= 2
    f = 3
    while f <= abs(n):
        if n % f == 0:
            a.append(f)
            n //= f
        else:
            f += 2
    if n != 1:
        a.append(n)
    return a


def binalized_list_n(x,n):
	i = x
	msb = 0
	if i < 0:
		i = 256 + i
		msb = 1
	LIST = []
	while i > 0:
		LIST.append(i%2)
		i //= 2
	while len(LIST) < n:
		LIST.append(msb)
	LIST.reverse()
	return LIST


def binalized_list_var(x):
	i = x
	plus = True
	if i < 0:
		plus = False
		i += 2
		n = 1
		while i < 0:
			i += 2**n
			n += 1
		i += 2**n
	LIST = []
	while i > 0:
		LIST.append(i%2)
		i //= 2
	if plus:
		LIST.append(0)
	LIST.reverse()
	return LIST