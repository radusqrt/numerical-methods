%  Solves linear systems A*x = B using super-over-relaxation method
%  success - 0 = solution found / 1 = maxiter exceeded

function [x success] = SOR(A, b, x0, w, tol, maxiter)

    %get the number of lines and columns from matrix A
    [n n] = size(A);
    %initialize a column vector for the solution
    x = zeros(n, 1);
    %I have not found the solution yet
    succes = 1;
  
    while maxiter > 0
        maxiter--;
    
        for i = 1:n
            %calculate the two sums that have to be extracted
            sum = A(i, 1 : i - 1) * x(1 : i - 1) + A(i, i + 1 : n) * x0(i + 1 : n);
            %calculate the i-th element of the current solution
            x(i) = w * (b(i) - sum)/A(i, i) + (1 - w) * x0(i);
        endfor
    
        if norm(x - x0) < tol
            %the solution found has an acceptable error, according to tolerance
            succes = 0;
            break;
        endif

        x0 = x;
    endwhile
endfunction