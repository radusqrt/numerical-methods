import numpy as np
import matplotlib.pyplot as plt

def Gershgorin (A):
    # A must be a square matrix
    (m,n)  = A.shape
    if m != n:
        print "You must introduce a square matrix"
        return

    plt.axes()
    # For each row:
    for i in range (0, n):
        # the circle has the center in (h, k) where
        # h is the real part of A(i,i) and k is the real part of A(i,i)
        h = np.real(A[i,i])
        k = np.imag(A[i,i])
        plt.plot(h, k, marker='x', markersize=5, color="blue")

        # the radius of the circle is the sum of 
        # norm of the elements in the row where i != j

        r = 0
        for j in range (0,n):
            if i != j:
                r = r + np.linalg.norm(A[i,j])
        # plot the circle
        circle = plt.Circle((h, k), r, fill = False)
        plt.gca().add_patch(circle)        

    eigenval = np.linalg.eigvals(A)
   # plot the eigenvalues of the matrix
    for x in eigenval:
        plt.plot(np.real(x), np.imag(x), marker='o', markersize=5, color="red")
    
    plt.axis('scaled')
    plt.show()
# example for a 3x3 matrix
A = np.random.rand(3,3)
print A
Gershgorin(A)