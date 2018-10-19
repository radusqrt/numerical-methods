% [USES] ad-hoc/SST
function [x] = GaussianElimination(A, b)
    n = size(A)(1);
    % build the augmented matrix so we do less operations (tr. matrice extinsa)
    Ae = [A b];

    for p = 1 : n - 1
        % check if the pivot is 0, by comparing it to eps (a very small value)
        if abs(Ae(p, p)) < eps
            x = NaN;
            return;
        endif

        % gaussian elimination
        for i = p + 1 : n
            arg = Ae(i, p) / Ae(p, p);
            Ae(i, :) = Ae(i, :) - arg * Ae(p, :);
        endfor
    endfor

    % solve the upper triangular system after separating A and b from Ae
    A = Ae(:, 1 : n);
    b = Ae(:, n + 1);
    x = SST(A, b);
endfunction
