% [USES] ad-hoc/SST, ad-hoc/SIT
function [L, U, x] = Crout(A, b)
    % U = eye(n) returns an n-by-n identity matrix with ones on the main
    % diagonal and zeros elsewhere
    % L = zeros(n) returns an n-by-n matrix of zeros
    n = length(b);
    L = zeros(n);
    U = eye(n);

    % Decomposition of matrix into L and U
    for i = 1 : n
        % calculate the lower triangular matrix
        sum_for_L = L(i : n, 1 : (i - 1)) * U(1 : (i - 1), i);
        L(i : n, i) = A(i : n, i) - sum_for_L;

        % calculate the upper triangular matrix
        sum_for_U = L(i, 1 : (i - 1)) * U(1 : (i - 1), (i + 1) : n);
        U(i, (i + 1) : n) = (A(i, (i + 1) : n) - sum_for_U) / L(i, i);
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
