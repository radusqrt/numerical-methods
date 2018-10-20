"""
solves f(x) = 0 by doing max_iter steps;
the method requires one initial value (x0)
which should be chosen close to the root;
y = polyval(f, x) returns the value of a polynomial evaluated at x;
y = polyder(f) returns the coefficients of the derivative of the polynomial
whose coefficients are given by the vector p;
"""

def newton_raphson_method_polynomial(f, x0, tol, max_iter):
    def derivative(f, x):
        h = 10e-10
        d = (f(x+h) - f(x)) / h
        return d

    eps = tol
    for i in range(1, max_iter):
        fx = f(x0)
        fxd = derivative(f, x0)
        # calculate the value of the new approximation, xi, using the formula;
        xi = x0 - fx / fxd
        # calculate the value of the polynomial evaluated at xi;
        fxi = f(xi)
        # check if xi is a root of the polynomial;
        if abs(fxi) < eps:
            x = xi
            return x, i

        epsilon = abs((xi - x0) / xi)
        # stop if the method reached its convergence limit;
        if epsilon < tol:
            x = xi
            return x, i

        # update the last computed value;
        x0 = xi;

    print('Maximum number of iterations reached');
