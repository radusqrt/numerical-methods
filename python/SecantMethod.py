import numpy as np

def f(x):
	return 2 * x**3 + 1

def SecantMethod(f, x0, x1, tol, max_iter):
	x = 0
	for i in range (1, max_iter):
		print("	La pasul: {}".format(i))
		f0 = f(x0)
		f1 = f(x1)
		print("f0 = {}; f1 = {}".format(f0, f1))
		xi = x1 - f1 * (x1 - x0) / (f1 - f0)
		fxi = f(xi) 
		print("xi = {}; fxi = {}".format(xi, fxi))

		# lin 18
		if (abs(fxi) < np.finfo(float).eps):
			x = xi
			return x
		epsilon = abs((xi - x1) / xi)

		print("Epsilon: {}".format(epsilon))

		#stop - 25
		if (epsilon < tol):
			x = xi
			return x
		x0 = x1
		x1 = xi

	print("Maximum number of iterations reached: {}".format(i))	    
	return x

print(SecantMethod(f, 17.0, 6.0, 10 ** (-10), 100))