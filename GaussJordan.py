import numpy as np
# calculate the inverse of the matrix A using Gauss-Jordan algorithm
def GaussJordan (A):
    (n, n) = A.shape
    B = np.eye(n)

    # Assume A has an inverse matrix
    success = 1

    if np.linalg.det(A) == 0:
        # A cannot be reversed
        B = np.empty(n)
        success = 0
        return

    # merge the two matrices
    Ae = np.concatenate((A, B.T), axis=1)
    for i in range (0, n):
        if Ae[i, i] == 0:
            B = np.empty(n)
            success = 0
            return
         # make the pivot position to one (as in the eye matrix)
        Ae[i, :] = Ae[i, :] / Ae[i, i]

        #form zeros above and under the main diagonal in the
        # first half and calculate the inverse in the second half
        for j in range(0, n):
            if i != j:
                Ae[j, :] = Ae[j, :] - Ae[i, :] * Ae[j, i]

    #extract the inverse of matrix A from the augmented matrix
    B = Ae[:, n : 2 * n ]
    return (B, success)


# example for a 4x4 matrix
A = np.random.rand(4,4)
(inv, success) = GaussJordan(A)
print "The inverse using Gauss-Jordan is:"
print inv
print "The inverse using inv from linalg is:"
print np.linalg.inv(A)