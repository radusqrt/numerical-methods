# Function that calculates the value of the Neville interpolation polynomial
# P_ij(x) for a vector of points (a, b) with a:xs, b:xs in the abscissa x;
# [NOTE] It doesn't use explicit caching (just the internal Octave caching
# system)


def nevillepoint(i, j, x, xs, ys):
    # Base case: P_ii(x) = f(x_i)
    # ys is 1 - indexed, so we have to add one to the index
    if i == j:
       y = ys[i]
       return y

    # x_j - x_i
    delta = xs[j] - xs[i]
    # P(i, j - 1, x)
    pij_ = (xs[j] - x) * nevillepoint(i, j - 1, x, xs, ys)
    # P(i + 1, j, x)
    pi_j = (x - xs[i]) * nevillepoint(i + 1, j, x, xs, ys)
    # P(i, j, x)
    y = (pij_ + pi_j) / delta
    return y
