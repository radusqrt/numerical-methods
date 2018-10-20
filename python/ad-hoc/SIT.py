import  numpy as np
def SIT(A, b):
    # if the matrix is not lower triangular, we cannot solve the system
    if np.allclose(A, np.tril(A)) == False:
        print("The matrix A is not lower triangular!")
        x = np.nan
        return

    n = len(b)
    x = np.zeros((n, 1))

    # calculate x1
    x[0, 0] = b[0, 0] / A[0, 0]

    # calculate x(i) forwards
    for i in range (1, n):
        sum_of_xs = np.dot(A[i, 0 : i], x[0 : i, 0])
        x[i, 0] = (b[i, 0] - sum_of_xs) / A[i, i]
    
    return x

print(SIT(np.tril(np.matrix([[1,2,3], [4,5,6], [7,8,9]])), np.array([[1], [14], [50]])))