% [USES] ad-hoc/SST, ad-hoc/SIT
function [L, U, x] = Doolittle(A, b)
    % L = eye(n) returns an identity matrix with ones on the main diagonal
    %     and zeros elsewhere
    % U = zeros(n) returns an n-by-n matrix of zeros
    n = length(A);
    L = eye(n);
    U = zeros(n);

    % Decomposition of matrix into L and U
    for i = 1 : n
        % calculate the upper triangular matrix
        sum_for_U = L(i , 1 : (i - 1)) * U(1 : (i - 1), i : n);
        U(i, i : n) = A(i, i : n) - sum_for_U;

        % calculate the lower triangular matrix
        sum_for_L = L((i + 1) : n, 1 : (i - 1)) * U(1 : (i - 1), i);
        L((i + 1) : n, i) = (A((i + 1) : n, i) - sum_for_L) / U(i, i);
    endfor

    % A * x = b; A = L * U
    % L * U * x = b;
    % L * y = b => y (SIT)
    % U * x = y => x (SST)

    % Solve the lower triangular system
    y = SIT(L, b);
    % Solve the upper triangular system
    x = SST(U, y);
endfunction
