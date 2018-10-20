import numpy as np

def bisection(functie, a, b, tol, nmax):
    # we search for the approximate solution
    # in a limited amount of steps
    for n in range(nmax):
        # we split the interval in which we search the solution and search at it's half
        c = a + (b - a) / 2
        # if we find the solution or the interval in which we search is very small 
        # we return the solution and the number of steps in which we found it
        if functie(c) == 0 or (b - a) / 2 < tol:
            return (c, n)
        # modify the searching interval
        if np.sign(functie(c)) * np.sign(functie(a)) < 0:
            b = c
        else:
            a = c
