import numpy as np

def bisection(functie, a, b, TOL, NMAX):
    N = 1
# we search for the approximate solution
# in a limmited ammount of steps
    while N <= NMAX:
# we split the interval in which we search the solution
# and search at it's half
        c = a + ( b - a ) / 2
# if we find the solution or the interval in which we search
# is very small we return the solution and the number of steps
# in which we found it
        if functie(c) == 0 or (b - a) / 2 < TOL:
            return (c, N)
# if the solution isn't found we increment the number of steps
# and modify the searching interval  
        N = N + 1
        if np.sign(functie(c)) * np.sign(functie(a)) < 0:
            b = c
        else:
            a = c