% checks if a matrix A is diagonally dominant 
function is_diag_dom = IsDiagonallyDominant(A)
    [n n] = size(A);
    % I assume it is diagonally dominant
    is_diag_dom = 1;

    for i = 1 : n
        % calculate the sum of absolute value of 
        %the elements on line i, except A(i, i)
        sum_of_line = sum(abs(A(i, :))) - abs(A(i, i));

        if abs(A(i, i)) <= sum_of_line
            is_diag_dom = 0;
            break;
        endif
    endfor
endfunction
