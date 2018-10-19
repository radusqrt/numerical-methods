% [USES] ad-hoc/SST
function [x] = GEPartialPivoting(A, b)
    n = size(A)(1);
    % build the augmented matrix so we do less operations (tr. matrice extinsa)
    Ae = [A b];

    for p = 1 : n - 1
        % we find the absolute maximum from A(p:n, p) to use it as a pivot
        [pivot, pivot_line] = max(abs(Ae(p : n, p)));
        pivot_line = pivot_line + p - 1;

        % get the new pivot on diagonal position
        temp = Ae(p, :);
        Ae(p, :) = Ae(pivot_line, :);
        Ae(pivot_line, :) = temp;

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
