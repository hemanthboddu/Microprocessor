def tobinary (n, width):
	s = ''
	for i in range(width):
		s = s + str(n%2)
		n = n / 2
		s = s [::-1]
	return s
f = open ('outputs.txt', 'w')
f.seek (0)
f.truncate()
for i in range(256):
	x = tobinary (i, 8)
	s = '000'
	if x == '00000000':
		N = '1'
		y = x
	else:
		N = '0'
	if x[7] == '1':
		s = '000'
		y = x[:6] + '0'
	elif x[6] == '1':
		s = '001'
		y = x[0:5] + '0' + x[7]
	elif x[5] == '1':
		s = '010'
		y = x[0:4] + '0' + x[6:7]
	elif x[4] == '1':
		s = '011'
		y = x[0:3] + '0' + x[5:7]
	elif x[3] == '1':
		s = '100'
		y = x[0:2] + '0' + x[4:7]
	elif x [2] == '1':
		s = '101'
		y = x[0:1] + '0' + x[3:7]
	elif x [1] == '1':
		s = '110'
		y = x[0] + '0' + x[2:7]
	elif x [0] == '1':
		s = '111'
	f.write(x + " " + s + " " + N + " " + y +"\n")
f.close()
