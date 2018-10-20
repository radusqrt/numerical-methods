from bisection import bisection

def f(x):
    return x ** 3 - x - 1

result = bisection(f, 0, 5, 0.001, 200)
print('solutia', result[0],'in', result[1], 'pasi')
print(f(result[0]))