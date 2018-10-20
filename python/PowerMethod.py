import numpy as np
import math

def PowerMethod(A, tol, max_iter):
    # Function that returns the largest eigenvalue of the matrix and the characteristic vector
    (n,n) = A.shape
    # Randomly choose the vector y with the values in the interval (0,1)
    y = np.random.rand (n , 1 )
    val = np.inf
    # Iterate to the maximum number of iterations

    for step in range(1,max_iter):
        z = np.matmul(A,y)
        # update the eigenvector
        y = z / np.linalg.norm(z)
        # backup the last eigenvalue approximation
        val_old = val
        # update the val value
        yt = np.transpose(y,axes=None)
        val = np.matmul(np.matmul(yt,A),y)
       # print val
        # when the new values get close enough to the last values
        # regarding the imposed tolerance "tol", we reached the solution
        if np.all(np.absolute(val - val_old) / val < tol):
            break
    return val, y, step        


#Example for a 2x2 matrix
A = np.random.rand(2,2) * 10
tol = 0.1
max_iter = 10
(val, y, step) =PowerMethod(A,tol,max_iter)
print val
print y
print step
