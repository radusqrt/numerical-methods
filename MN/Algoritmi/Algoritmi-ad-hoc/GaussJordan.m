%calculates the reverse of matrix A
function B = GaussJordan(A)
    [n n] = size(A);
    B = eye(n);

    if det(A) == 0
        %A cannot be reversed
        B = NaN;
        return;
    endif 

    for i = 1 : n
        if A(i, i) == 0
            %change lines
            for k = 1 : n
                if A(k, k) ~= 0
                    %change line i with line k in matrix A
                    aux = A(i, :);
                    A(i, :) = A(k, :);
                    A(k, :) = aux;

                    %change line i with line k in matrix B
                    aux = B(i, :);
                    B(i, :) = B(k, :);
                    B(k, :) = aux;

                    %only one interchange is needed
                    break;
                endif
            endfor
        endif

        %calculate the pivot
        B(i, :) = B(i, :) / A(i, i);
        A(i, :) = A(i, :) / A(i, i);

        %form zeros above and under the main diagonal in A
        %calculate the inverse in B
        for j = 1 : n
            if i ~= j
                B(j, :) = B(j, :) - B(i, :) * A(j, i);
                A(j, :) = A(j, :) - A(i, :) * A(j, i);
            endif
        endfor
    endfor
        
endfunction
