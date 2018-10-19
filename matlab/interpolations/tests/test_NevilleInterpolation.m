% [USES] interpolations/NevilleInterpolation

xs = [1, 2, 3, 4, 5, 6, 7, 8];
ys = sin(xs) + 2;
[xss yss] = NevilleInterpolation(xs, ys, 100);