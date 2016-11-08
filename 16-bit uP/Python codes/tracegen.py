def toBit(a):
	s = bin(a)
	p = 18 - len(s)
	for i in range(p):
		print("0",end="")
	print(s[2:],end="")
	return
  


for a in range(2**8):
	for b in range(2**8):
		toBit(a)
		print(end=" ")
		toBit(b)
		print(" ",end="")
		toBit(a+b) 
		print();
