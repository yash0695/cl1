import xml.etree.ElementTree as ET

tree=ET.parse("table.xml")
root=tree.getroot()

term=[]
nonterm=[]
lsprod=[]
rsprod=[]
n=0

for child in root:
	if child.tag=="states":
		n=int(child.text)
	elif child.tag=="term":
		term.append(child.text)
	elif child.tag=="nonterm":
		nonterm.append(child.text)
	elif child.tag=="productions":
		for ch in child:
			lsprod.append(ch[0].text)
			rsprod.append(ch[1].text)
	elif child.tag=="actiontable":
		action=[[]for x in range(n)]
		i=0
		for ch in child:
			for c in ch:
				action[i].append(c.text)
			i+=1
	elif child.tag=="gototable":
		goto=[[]for x in range(n)]
		i=0
		for ch in child:
			for c in ch:
				goto[i].append(c.text)
			i+=1


print "enter an expression"
input_string=raw_input()

stack=['$',0]
iptr=0

while True:
		
		current=input_string[iptr]
		current_index=term.index(current)

		top=stack[len(stack)-1]
	
		ac=action[top][current_index]
		print "action detected is "+ac+" for input string symbol "+current

		if ac=="error":
			print "cannot be parsed"
			break
		elif ac=="accept":
			print "yaay success"
			break
		elif ("s" in ac):
			stack.append(current)
			ns=ac.replace("s","")
			stack.append(int(ns))
			iptr+=1
			print stack
		elif ("r" in ac):
			rrule=int(ac.replace("r",""))
			print "reducing using rule "+lsprod[rrule-1]+"->"+rsprod[rrule-1]
			for i in range (2* len( rsprod[rrule-1] ) ):
				stack.pop()
			stack.append(lsprod[rrule-1])

			stack.append ( int ( goto [stack[len(stack)-2]][nonterm.index(stack[len(stack)-1])] ))
			print stack


	
