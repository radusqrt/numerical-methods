import numpy as np


# checks if a matrix A is diagonally dominant
def IsDiagonallyDominant(A):
  (n, n) = A.shape
  # I assume it is diagonally dominant
  is_diag_dom = 1

  for i in range (0, n):
    # calculate the sum of absolute value of 
    # the elements on line i, except A(i, i)
    sum_of_line = np.sum(abs(A[i, :])) - abs(A[i, i])

    if abs(A[i, i]) <= sum_of_line:
      is_diag_dom = 0
      break

  return is_diag_dom
