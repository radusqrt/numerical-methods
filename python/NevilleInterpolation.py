import numpy as np
import matplotlib.pyplot as plt
from NevillePoint import nevillepoint


# [USES] interpolations/NevillePoint
# Function that calculates the Neville interpolation polynomial for a vector
# of points (a, b) with a:xs, b:ys in "elements" points between the first of xs
# and the last of xs; it also plots the interpolation
def nevilleinterpolation(xs, ys, elements=100):
    n = len(xs)
    xss = np.linspace(xs[0], xs[n - 1], elements)
    # create an empty vector to store the values of the interpolation in the
    # xss' points
    yss = []

    for i in range(0, len(xss)):
        # Calculate the approximation of the function in xss(i)
        yss.append(nevillepoint(0, n - 1, xss[i], xs, ys))



    print(yss)
    # plot the interpolated function
    plt.plot(xss, yss)
    # plot the initial points as circles
    plt.plot(xs, ys, 'o', "linewidth", 3)
    plt.show()

