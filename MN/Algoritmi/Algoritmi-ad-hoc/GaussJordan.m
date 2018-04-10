%calculates the reverse of matrix A
function B = GaussJordan(A)
    [n n] = size(A);
    B = eye(n);

    if det(A) == 0
        %A cannot be reversed
        B = NaN;
        return;
    endif 
    
    %merge thw two matrices
    Ae = [A B];
    for i = 1 : n
        if Ae(i, i) == 0
            %change lines
            for k = i : n
                if Ae(k, k) ~= 0
                    %change line i with line k in matrix A
                    aux = Ae(i, :);
                    Ae(i, :) = Ae(k, :);
                    Ae(k, :) = aux;

                    %only one interchange is needed
                    break;
                endif
            endfor
        endif

        %calculate the pivot
        Ae(i, :) = Ae(i, :) / Ae(i, i);

        %form zeros above and under the main diagonal in A
        %calculate the inverse in B
        for j = 1 : n
            if i ~= j
                Ae(j, :) = Ae(j, :) - Ae(i, :) * Ae(j, i);
            endif
        endfor
    endfor
    
    %extract matrix B
    B = Ae(:, n + 1 : 2 * n);
endfunction