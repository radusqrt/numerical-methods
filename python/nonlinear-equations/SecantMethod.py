def secant_method(f, x0, x1, tol, max_iter):
    # solves f(x) = 0 by doing max_iter steps of the secant method;
    # the secant method requires two initial values, x0 and x1
    # which should ideally be chosen close to the root;
    # y = feval(f, x)  evaluates a function using its name or its handle
    # and using the input arguments;

    eps = tol
    for i in range(1, max_iter):
        # function values: f(x0) and f(x1)
        f0 = f(x0)
        f1 = f(x1)

        # the root of function f is approximated using the formula
        xi = x1 - f1 * (x1 - x0) / (f1 - f0)

        # calculate f(xi)
        fi = f(xi)

        # xi is the solution
        if abs(fi) < eps:
            x = xi
            return x, i

        # calculate eps
        epsilon = abs((xi - x1) / xi)

        # stop if the secant method reached its convergence limit
        if epsilon < tol:
            x = xi
            return x, i

        # update the last two computed values
        x0 = x1
        x1 = xi
