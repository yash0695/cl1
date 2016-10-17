import json
import os

cnt=0
soln=[0 for x in range(8)]

def main():
	
	with open("input.json") as f:
		data=json.load(f)

	start=data['start']
	soln[0]=start
	print "all 92 solutions are "
	queen(0)
	print "solutions considering json file are"
	soln[0]=start
	queen(1)

def queen(k):
	for i in range(8):
		if place(k,i):
			soln[k]=i
			if(k==7):
				printsoln()
			else:
				queen(k+1)


def place(k,i):
	for j in range(k):
		if soln[j]==i or abs(soln[j]-i)==abs(j-k):
			return 0
	return 1


def printsoln():
	global cnt
	cnt+=1
	print cnt
	for i in range(8):
		for j in range(8):
			if soln[i]==j:
				print(i,j)

main()
