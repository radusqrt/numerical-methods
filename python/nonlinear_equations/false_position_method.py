# False Position Method

from __future__ import division, print_function
from numpy import abs, cos, sin, exp, sqrt, array, append, ceil, log2, arange, linspace
import matplotlib.pyplot as plt

def regula_falsi(fun, a, b, c, valerr=100, niter=5000, ftol=1e-06, verbose=False):
    if fun(a) * fun(b) > 0:
        c = None
        msg = "The function should have a sign change in the interval."
    else:
        ax = array([])
        acont = array([])
        avalerr = array([])
        for cont in range(niter):
            
            ax = append(ax,c)
            acont = append(acont,cont)
            avalerr = append(avalerr,valerr)
            
            qa = fun(a)
            qb = fun(b)
            valp = c
            c = (a*qb - b*qa)/(qb - qa)
            qc = fun(c)
            valf = c
            valerr = abs((valf - valp)/valf) * 100
            
            if verbose:
                print("n: {}, \tx: {}, \terr: {}%".format(cont, c,valerr))
                
            msg = "Maximum number of iterations reached."
            
            if abs(qc) < ftol:
                msg = "Root found with desired accuracy."
                break
            elif qa * qc < 0:
                b = c
            elif qb * qc < 0:
                a = c
    return ax, avalerr, acont, msg