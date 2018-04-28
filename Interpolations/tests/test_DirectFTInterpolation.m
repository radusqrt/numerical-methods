% [USES] Interpolations/DirectFTInterpolation
n = 128;
m = 20000;
% creating the input n points
x = linspace(-pi, pi, n);
% the function we're trying to interpolate between [-0.9*pi; 0.9*pi]
y = x.^3+2.*(x.^2)-5.*x;
% interpolating in m points
z = linspace(-pi*0.9, pi*0.9, m);
% the actual function values for comparison
z2 = z.^3+2.*(z.^2)-5.*z;

% applying the Direct Fast Fourier Transform
S = DirectFTInterpolation(x, y, z);

% plot the two results for graphic comparison
plot(z, S, z, z2);
