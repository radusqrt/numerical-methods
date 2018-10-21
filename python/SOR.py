import numpy as np
import math

x = np.array([[2.0, 2.0], 
				[1.0, 3.0]])
b = np.array([[2.0], [1.0]])
x0 = np.array([[0.0], [0.0]])
tol = 10 ^ (-10)
max_iter = 5	
w = 1.1

def SOR(A, b, x0, tol, max_iter, w):
	# sanity checks
	if (w >= 2 or w <= 0):
		print('w should be inside (0, 2)');
		step = -1;
		x = float('nan')
		return
	n = b.shape
	x = x0

	# iterate to the maximum number of iterations
	for step in range (1, max_iter):
		# iterate through every x[i]
		for i in range(n[0]):
			# compute the sum using the updated values from the current step
			new_values_sum = np.dot(A[i, 1 : (i - 1)], x[1 : (i - 1)])
			#  compute the sum using the previous step values
			for j in range(i + 1, n[0]):
				old_values_sum = np.dot(A[i, j], x0[j])
			print(old_values_sum)
			x[i] = b[i] - (old_values_sum + new_values_sum) / A[i, i]
			x[i] = np.dot(x[i], w) + np.dot(x0[i], (1 - w)) 

	    # when the new values get close enough to the last values
        # regarding the imposed tolerance "tol", we reached the solution
		if (np.linalg.norm(x - x0) < tol):
			print(step)
			break
		# update the last computed values with the new values
		x0 = x
	print("X = {}".format(x))
	print("Numarul de pasi este: {}".format(step))
SOR(x, b, x0, tol, max_iter, w)