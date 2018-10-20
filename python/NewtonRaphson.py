import numpy as np


def NewtonRaphson(f, x0, tol, max_iter):
    # solves f(x) = 0 by doing max_iter steps;
    # the method requires one initial value (x0)
    # which should be chosen close to the root;
    # y = np.polyval(f, x) returns the value of a polynomial evaluated at x;
    # y = np.polyder(f) returns the coefficients of the derivative of the polynomial
    # whose coefficients are given by the vector p;
    fd = np.polyder(f)
    for i in range(0, max_iter):
        fx = np.polyval(f, x0)
        fxd = np.polyval(fd, x0)
        # calculate the value of the new approximation, xi, using the formula;
        xi = x0 - fx / fxd
        # calculate the value of the polynomial evaluated at xi;
        fxi = np.polyval(f, xi)
        # check if xi is a root of the polynomial;
        if abs(fxi) < np.spacing(1):
            x = xi
            return [x, i]
        epsilon = abs((xi - x0) / xi)
        # stop if the method reached its convergence limit;
        if epsilon < tol:
            x = xi
            return [x, i]
        # update the last computed value;
        x0 = xi
    print("Maximum number of iterations reached")