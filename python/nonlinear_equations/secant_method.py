# Secant Method

from __future__ import division, print_function
from numpy import abs, cos, sin, exp, sqrt, array, append, ceil, log2, arange, linspace
import matplotlib.pyplot as plt

def secant(fun, xp, x, valerr=100, niter=5000, ftol=1e-06, verbose=False):
    msg = "Maximum number of iterations reached."
    ax = array([])
    acont = array([])
    avalerr = array([])
    for cont in range(niter):
        
        if verbose:
            print("n: {}, \tx: {}, \terr: {}%".format(cont, x,valerr))
            
        ax = append(ax,x)
        acont = append(acont,cont)
        avalerr = append(avalerr,valerr)
        
        valp = x
        x = x - ((x - xp)/(fun(x)-fun(xp)))*fun(x)
        valf = x
        valerr = abs((valf - valp)/valf) * 100
        
        if abs(fun(x)) < ftol:
            msg = "Root found with desired accuracy."
            break
    return ax, avalerr, acont, msg