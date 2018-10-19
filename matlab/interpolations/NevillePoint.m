% Function that calculates the value of the Neville interpolation polynomial
% P_ij(x) for a vector of points (a, b) with a:xs, b:xs in the abscissa x;
% [NOTE] It doesn't use explicit caching (just the internal Octave caching
% system)
function [y] = NevillePoint(i, j, x, xs, ys)
    % Base case: P_ii(x) = f(x_i)
    % ys is 1-indexed, so we have to add one to the index
    if i == j
        y = ys(i + 1);
        return;
    endif

    % x_j - x_i
    delta = xs(j + 1) - xs(i + 1);
    % P(i, j - 1, x)
    Pij_ = (xs(j + 1) - x) * NevillePoint(i, j - 1, x, xs, ys);
    % P(i + 1, j, x)
    Pi_j = (x - xs(i + 1)) * NevillePoint(i + 1, j, x, xs, ys);

    % P(i, j, x)
    y = (Pij_ + Pi_j) / delta;
endfunction