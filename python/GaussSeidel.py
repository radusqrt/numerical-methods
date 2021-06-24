import numpy as np
import math

x = np.array([[2, 2], 
				[1, 3]])
b = np.array([[2], [1]])
x0 = np.array([[0], [0]])
tol = 10 ^ (-10)
max_iter = 100

def GaussSeidel(A, b, x0, tol, max_iter):
	# use this algorithm only if it converges
	N = np.tril(A)
	P = N - A
	Ggs = np.dot(np.linalg.inv(N), P)
	# calculate the spectral radius of Ggs
	aux = np.linalg.eig(Ggs)
	sr = np.max(np.abs(aux[0]))

	# check if the algorithm converges
	if (sr - 1 >= np.finfo(float).eps):
		x = float('nan')
		step = -1
		print("Matrix does not converge")
		return
	n = b.shape
	x = x0
	# iterate to the maximum number of iterations
	for step in range (1, max_iter):
		# iterate through every x[i]
		for i in range(n[0]):
            # compute the sum using the updated values from the current step
			new_values_sum = np.dot(A[i, 1 : i - 1], x[1 : i - 1])

			#  compute the sum using the previous step values
			for j in range(i + 1, n[0]):
				old_values_sum = np.dot(A[i, j], x0[j])
			x[i] = b[i] - (old_values_sum + new_values_sum)
			x[i] = x[i] / A[i, i]

        # when the new values get close enough to the last values
        # regarding the imposed tolerance "tol", we reached the solution
		if (np.linalg.norm(x - x0) < tol):
			print(step)
			break
		# update the last computed values with the new values
		x0 = x
	print("X = {}".format(x))
	print("Numarul de pasi este: {}".format(step))

GaussSeidel(x, b, x0, tol, max_iter)