import os
import getopt
import sys

def transDelay(t,M):
	return (M/t)*10*3

def propDelay(d,S):
	return d/(S*100)

def main():
	t1,t2,d1,d2,N,M,S,p = 1,1,1,1,1,1,1,1 #Default
	opts, args = getopt.getopt(sys.argv[1:],'N:M:S:p:',['t1=','t2=','d1=','d2=','help'])
	if len(opts) == 0 :
		print "\nPlease use the correct arguments\n"
		sys.exit(2)
	for opt,arg in opts:
		if opt == '--t1':
			t1 = float(arg)
		elif opt == '--t2':
			t2 = float(arg)
		elif opt == '--d1':
			d1 = float(arg)
		elif opt == '--d2':
			d2 =float(arg)
		elif opt == '-N':
			N = float(arg)
		elif opt == '-M':
			M = float(arg)
		elif opt == '-S':
			S = float(arg)
		elif opt == '-p':	
			p = float(arg)
		else:
			print "\nUnhandled operation\n"
	print "\nAll values are in ms\n"
	print "Packet\t\tA\t\tR\t\tB"
	n,A,B,queueDelay= 1,0,0,0
        while n<=N:
                R = A + transDelay(t1,M) + propDelay(d1,S)
		B = R + queueDelay + p + transDelay(t2,M) + propDelay(d2,S)
                if R < transDelay(t2,M):
                        queueDelay = queueDelay + transDelay(t2,M) - transDelay(t1,M)
		print "P",n,"		",A,"		",R,"		",B
                n,A = n + 1,A + transDelay(t1,M)
	print "\nEnd to End transmission delay = \n",B

		
main()
