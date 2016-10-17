import os
import sys

def transdelay(t,m):
	return ((m/t)*1000)   #returning value in milliseconds

def propdelay(d,s):
	return (d/(s*100))    #returning value in milliseconds


def main():
	t1,t2,d1,d2,N,M,S,p=1,1,1,1,1,1,1,1

	print "End to end delay calculator      A-------Router------B"
	print "enter transmission rate at link 1 (in Mbps)----- "
	t1=float(raw_input())
	print "enter transmission rate at link 2 (in Mbps)----- "
	t2=float(raw_input())
	print "enter distance of link1 (kms)----- "
	d1=float(raw_input())
	print "enter distance of link2 (kms)----- "
	d2=float(raw_input())
	print "enter number of packets to be sent----"
	N=float(raw_input())
	print "enter size of each packet (Mb)----"
	M=float(raw_input())
	print "enter speed of propagation ( 10^8 m/s)----"
	S=float(raw_input())
	print "enter average router processing delay (ms)----"
	p=float(raw_input())

	print t1
	n,A,R,B,queuedelay=1,0,0,0,0
	print "packet\tA\tR\tB"
	while(n<=N):
		R= A + transdelay(t1,M) + propdelay(d1,S)
		B= R + queuedelay + p + transdelay(t2,M) + propdelay(d2,S)
		if R<transdelay(t2,M):
			queuedelay=queuedelay+transdelay(t2,M)-transdelay(t1,M)
		print "P",n,"\t",A,"\t",R,"\t",B
		n,A=n+1,A+transdelay(t1,M)

	print "final end to end delay in ms is ",B

main()
