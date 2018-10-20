import numpy as np
m = int(input('number of rows and columns, m = '))
matrix = []; columns = []
matrix1 = []
# initialize the number of rows
for i in range(0,m):
    matrix += [0]
    matrix1 += [0]
# initialize the matrix
for i in range (0,m):
    matrix[i] = [0]*m
    matrix1[i] = [0]*m
    	
for i in range (0,m):
    for j in range (0,m):
        print ('entry in row: ',i+1,' column: ',j+1)
        matrix[i][j] = float(input())
for i in range (0,m):
	for j in range (0,m):
		if i==j:
			matrix1[i][j] = 1.0;	        

A = np.array(matrix);
B = np.array(matrix1);
if(np.linalg.det(A)!=0):
	for i in range(0,m):
		c = A[i,i];
		A[i,:] = A[i,:]/c;
		B[i,:] = B[i,:]/c;
		
		for j in range(0,m):
			if i!=j:
				d = A[j,i];
				print(d)
				A[j,:] = A[j,:]-d*A[i,:];
				B[j,:] = B[j,:]-d*B[i,:];
	print(B)
else:
	print("Inverse not possible as determinant of matrix is zero");

