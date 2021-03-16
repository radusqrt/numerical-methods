# Bisection Method

from __future__ import division, print_function
from numpy import abs, cos, sin, exp, sqrt, array, append, ceil, log2, arange, linspace
import matplotlib.pyplot as plt

def bisection(fun, a, b, c, valerr=100, xtol=1e-6, ftol=1e-06, verbose=False):
# def bisection(fun, a, b, c, valerr=100, nmax=5000, ftol=1e-06, verbose=False):
    if fun(a) * fun(b) > 0:
        c = None
        msg = "The function should have a sign change in the interval."
    else:
        nmax = int(ceil(log2((b - a)/xtol)))
        ax = array([])
        acont = array([])
        avalerr = array([])
        for cont in range(nmax):

            ax = append(ax,c)
            acont = append(acont,cont)
            avalerr = append(avalerr,valerr)

            if verbose:
                print("n: {}, \tx: {}, \terr: {}%".format(cont, c,valerr))

            valp = c
            c = 0.5*(a + b)
            valf = c
            valerr = abs((valf - valp)/valf) * 100

            if abs(fun(c)) < ftol:
                msg = "Root found with desired accuracy."
                break
            elif fun(a) * fun(c) < 0:
                b = c
            elif fun(b) * fun(c) < 0:
                a = c
            msg = "Maximum number of iterations reached."
    return ax, avalerr, acont, msg
    