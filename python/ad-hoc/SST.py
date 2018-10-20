import  numpy as np
def SST(A, b):
  # if the matrix is not upper triangular, we cannot solve the system
  if not np.allclose(A, np.triu(A)):
    print("The matrix A is not upper triangular!")
    return np.nan

  n = len(b)
  x = np.zeros((n, 1))

  # calculate xn
  x[n - 1, 0] = b[n - 1, 0] / A[n - 1, n - 1]

  # calculate x(i) backwards
  for i in range(n - 2, -1, -1):
    sum_of_xs = np.dot(A[i, (i + 1) : n], x[(i + 1) : n, 0])
    x[i, 0] = (b[i, 0] - sum_of_xs) / A[i, i]
    
  return x