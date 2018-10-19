% [USES] ad-hoc/SST
function [x] = GETotalPivoting(A, b)
    n = size(A)(1);
    % build the augmented matrix so we do less operations (tr. matrice extinsa)
    Ae = [A b];
    % build the permutation vector
    perm = [1:n];

    for p = 1 : n - 1
        % we find the absolute maximum from A(p:n, p:n) to use it as a pivot
        [pivot, pivot_line] = max(abs(Ae(p : n, p : n)));
        [pivot, pivot_column] = max(pivot);
        pivot_line = pivot_line + p - 1;
        pivot_line = pivot_line(pivot_column);
        pivot_column = pivot_column + p - 1;

        % get the new pivot on diagonal position
        temp = Ae(p, :);
        Ae(p, :) = Ae(pivot_line, :);
        Ae(pivot_line, :) = temp;

        temp = Ae(:, p);
        Ae(:, p) = Ae(:, pivot_column);
        Ae(:, pivot_column) = temp;

        % update the permutation vector
        temp = perm(p);
        perm(p) = perm(pivot_column);
        perm(pivot_column) = temp;

        % gaussian elimination
        for i = p + 1 : n
            % check if the pivot is 0, by comparing it to eps (a very small value)
            if abs(A(p, p)) < eps
                disp('One of the pivots is 0');
                x = NaN;
                return;
            endif

            arg = Ae(i, p) / Ae(p, p);
            Ae(i, :) = Ae(i, :) - arg * Ae(p, :);
        endfor
    endfor

    % solve the upper triangular system after separating A and b from Ae
    A = Ae(:, 1 : n);
    b = Ae(:, n + 1);
    x = SST(A, b);
    % apply the permutation vector to the solution
    x = x(perm);
endfunction
