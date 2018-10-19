% [USES] ad-hoc/plotCircle
function plotGershgorin(A)
    % A must be a square matrix
    n = length(A);
    figure

    for i = 1 : n
        sum_of_line = sum(abs(A(i, :))) - abs(A(i, i));
        left = -sum_of_line + A(i, i);
        right = sum_of_line + A(i, i);
        % calculate the center of the i-th circle on the x-axis
        middle = (left + right) / 2;
        % calculate the radius
        radius = (right - left) / 2;
        % plot the circle
        plotCircle(middle, 0, radius);
    endfor

    % plot the eigenvalues for proof of concept
    hold on
    plot(real(eig(A)), imag(eig(A)), 'x', 'markersize', 15)
    hold off
endfunction
