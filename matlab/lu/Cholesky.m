% [USES] ad-hoc/SST, ad-hoc/SIT
% calculates Cholesky factorization, A = L * L'
% A must be positive-definite
function [L U x] = Cholesky (A, b)
    
    % Check positive definition and symetry of A
    if !isequal(A, A') || IsPositiveDefinite(A) == 0
        L = NaN;
        U = NaN;
        x = NaN;
        return;
    endif
    
    % Inits
    n = length(A);
    L = zeros(n);
    U = zeros(n);
    
    for p = 1:n
        % Calculate the elements on the main diagonal
        tmp_sum = L(p, 1:(p - 1)) * L(p, 1:(p - 1))';
        L(p, p) = sqrt(A(p, p) - tmp_sum);
        
        % p == n --> last element that we calculated above; we need
        % to exit
        if p == n
            return;
        endif
        
        % Calculate the elements under the main diagonal
        % sum(A, 2) - sums matrix A with respect to the lines
        tmp_sum2 = sum((L(p, 1:(p - 1)) .* L((p + 1):n, 1:(p - 1))), 2);        
        L((p + 1):n, p) = ( A((p + 1):n, p) - tmp_sum2 ) / L(p, p);
    endfor
    
    U = L';
    
    % A * x = b; A = L * U; A = L * L'
    % L * (L' * x) = b
    % L' * x = y;
    % L * y = b;
    y = SIT(L, b);
    x = SST(U, y);
endfunction
