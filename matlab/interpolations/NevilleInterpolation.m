% [USES] interpolations/NevillePoint
% Function that calculates the Neville interpolation polynomial for a vector
% of points (a, b) with a:xs, b:ys in "elements" points between the first of xs
% and the last of xs; it also plots the interpolation
function [xss yss] = NevilleInterpolation(xs, ys, elements)
    n = length(xs);
    % if "elements" is given, use it; otherwise, use the default value of
    % linspace (usually 100)
    if exist("elements", "var") == 1
        xss = linspace(xs(1), xs(n), elements);
    else
        xss = linspace(xs(1), xs(n));
    endif

    % create an empty vector to store the values of the interpolation in the
    % xss' points
    yss = [];
    for i = 1:length(xss)
        % Calculate the approximation of the function in xss(i)
        yss = [yss NevillePoint(0, n - 1, xss(i), xs, ys)];
    endfor

    % open a new figure to merge two plots
    figure
    % plot the interpolated function
    plot(xss, yss, "linewidth", 3)
    % keep the chart in the figure to plot something else on top of it
    hold on
    % plot the initial points as circles
    plot(xs, ys, 'o', 'linewidth', 3)
endfunction