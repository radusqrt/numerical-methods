% [USES] ad-hoc/SST, ad-hoc/SIT
% calculates Cholesky factorization, A = L * L'
% A must be positive-definite
function [L U x] = Cholesky (A, b)
    % get the size of the matrix A
    [n n] = size(A);
    % initialize the lower and upper matrix of size N
    L = zeros(n);
    U = zeros(n);

    % check if A is positive definite
    if IsPositiveDefinite(A) == 0 || A ~= A'
        L = NaN;
        U = NaN;
        x = NaN;
        return;
    endif

    % A is positive definite and A is also symmetric, yay!
    % calculate the factorization, A = L * L'
    L(1, 1) = sqrt(A(1, 1));
    % calculate only the elements situated under and on the main diagonal
    for i = 1:n
        for j = 1:i
            sum_of_line = 0;
            if i == j
                sum_of_line = sum(L(i, 1:j - 1) .^ 2);
                % calculate an element on the main diagonal
                L(i, i) = sqrt(A(i, i) - sum_of_line);
            else
                sum_of_line = sum(L(i, 1: j - 1) .* L(j, 1: j - 1));
                % calculate the sum of the previous elements on the same line
                L(i, j) = (A(i, j) - sum_of_line) / L(j, j);
            endif
        endfor
    endfor

    U = L';
    % A * x = b; A = L * U; A = L * L'
    % L * (L' * x) = b
    % L' * x = y;
    % L * y = b;
    y = SIT(L, b);
    x = SST(U, y);
endfunction
