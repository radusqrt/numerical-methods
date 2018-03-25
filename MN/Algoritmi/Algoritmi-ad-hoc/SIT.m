function [x] =  SIT(A, b)
    % if the matrix is not lower triangular, we cannot solve the system
    % triu(A, 1) returns the upper triangular portion without the main diagonal
    % max(matrix) gets us a list of every column's max
    % max(list) gets us the maximum from the list
    % [NOTE] There is a function called "istril(A)" which returns 1 if A is a
    %   lower triangular matrix but it doesn't catch the e-16 errors
    %   which should be ignored
    if max(max(abs(triu(A, 1)))) > 10^3 * eps
        disp('The matrix A is not lower triangular!');
        x = NaN;
        return;
    endif

    n = length(b);
    x = zeros(n, 1);

    % calculate x1
    x(1) = b(1) / A(1, 1);

    % calculate x(i) forwards
    for i = 2 : n
        sum_of_xs = A(i, 1 : (i - 1)) * x(1 : (i - 1), 1);
        x(i) = (b(i) - sum_of_xs) / A(i, i);
    endfor
endfunction
