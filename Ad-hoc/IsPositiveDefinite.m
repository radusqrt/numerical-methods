% checks if a matrix A is positive definite
function is_pos_def = IsPositiveDefinite(A)
    [n n] = size(A);
    % I assume it is positive definite
    is_pos_def = 1; 

    % A is positive definite if it is diagonally-dominant,
    % A(i, i) > 0 and A is symmetrical
    if IsDiagonallyDominant(A) == 1 && diag(A) > 0 && A == A'
        return;    
    endif

    % A can be positive definite with Sylvester theorem
    for i = 1 : n
        B = A(1 : i, 1 : i);
        if det(B) < 0
            % turns out it is not positive-definite
            is_pos_def = 0; 
            break;
        endif
    endfor
endfunction
