import numpy as np
import math

x = np.array([[1, 2, 3], 
				[2, 3, 4], 
				[3, 4, 6]])
b = np.array([[1], [2], [3]])
x0 = np.array([[10], [20], [30]])
tol = 10 ^ (-10)
max_iter = 100


def Jacobi(A, b, x0, tol, max_iter):
	# use this algorithm only if it converges
	N = np.diag(np.diag(A))
	P = N - A
	Gj = np.dot(np.linalg.inv(N), P)
	
	# calculate the spectral radius of Gj
	aux = np.linalg.eig(Gj)
	sr = np.max(np.abs(aux[0]))

	# check if the algorithm converges
	if (sr - 1 >= np.finfo(float).eps):
		x = float('nan')
		step = -1
		print("Matrix does not converge")
		return
	# iterate to the maximum number of iterations
	n = b.shape
	x = x0
	for step in range (1, max_iter):
		# iterate through every x[i]
		for i in range(n[0]):
			#  val_sum represents the sum of the Jacobi algorithm and
   			# A(i, i) * x0(i) for which we calculate val_x so that we can
   			# substract it from val_sum
			val_sum = np.dot(A[i, :], x0[:, 0])
			val_x = np.dot(A[i, i], x0[i])
			x[i] = b[i] - (val_sum - val_x)
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
Jacobi(x, b, x0, tol, max_iter)
