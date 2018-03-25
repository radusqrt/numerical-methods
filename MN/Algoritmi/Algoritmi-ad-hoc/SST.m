function [x] = SST(A, b)
    % if the matrix is not upper triangular, we cannot solve the system
    % tril(A, -1) gets us what is strictly under the main diagonal
    % max(matrix) gets us a list of every column's max
    % max(list) gets us the maximum from the list
    % [NOTE] There is a function called "istriu(A)" which returns 1 if A is an
    %   upper triangular matrix but it doesn't catch the e-16 errors
    %   which should be ignored
    if max(max(abs(tril(A, -1)))) > 10^3 * eps
        disp('The matrix A is not upper triangular!');
        x = NaN;
        return;
    endif

    n = length(b);
    x = zeros(n, 1);

    % calculate xn
    x(n) = b(n) / A(n, n);

    % calculate x(i) backwards
    for i = (n - 1): -1 : 1
        sum_of_xs = A(i, (i + 1) : n) * x((i + 1) : n, 1);
        x(i) = (b(i) - sum_of_xs) / A(i, i);
    endfor
endfunction
