#!/usr/bin/env python3
import sys

def print_help():
	print("""Usage: ./pairlist.py <list1> <list2>
	*The lists must be the same length
	ex:
		./pairlist.py [a b c] [1 2 3]
		a1 b2 c3""")
	exit(1)

if len(sys.argv) != 3:
	print_help()

if len(sys.argv[1]) != len(sys.argv[2]):
	print_help()

def make_py_list(arg):
	# remove the "[" and "]" chars
	while (ind := arg.find('[')) != -1:
		arg = (arg[:ind] if ind > 0 else "") + arg[ind+1:]
	while (ind := arg.find(']')) != -1:
		arg = (arg[:ind] if ind > 0 else "") + arg[ind+1:]
	return arg.split(' ')

lists = map(make_py_list, sys.argv[1:])
output = ""
for li1, li2 in zip(*lists):
	output += f'{li1}{li2} '
print(output[:-1],end='')