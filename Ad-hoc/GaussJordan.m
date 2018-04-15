% computes reverse of matrix A
function [B success] = GaussJordan(A)
    [n n] = size(A);
    B = eye(n);
    % I assume A has an inverse matrix
    success = 1;

    if det(A) == 0
        %A cannot be reversed
        B = NaN;
        success = 0;
        return;
    endif 
    
    % merge the two matrices
    Ae = [A B];
    for i = 1 : n
        if Ae(i, i) == 0
            B = NaN;
            success = 0;
            return;
        endif

        % calculate the pivot
        Ae(i, :) = Ae(i, :) / Ae(i, i);

        % form zeros above and under the main diagonal in A
        % calculate the inverse in B
        for j = 1 : n
            if i ~= j
                Ae(j, :) = Ae(j, :) - Ae(i, :) * Ae(j, i);
            endif
        endfor
    endfor
    
    % extract matrix B
    B = Ae(:, n + 1 : 2 * n);
endfunction
