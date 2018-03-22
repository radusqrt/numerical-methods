function [x step] = SOR(A, b, x0, tol, max_iter, w)
    % use this algorithm only if it converges
    
    % sanity checks
    if (w >= 2 || w <= 0)
        disp('w should be inside (0, 2)');
        step = -1;
        x = NaN;
        return;
    endif
    
    n = length(b);
    x = x0;
    % iterate to the maximum number of iterations 
    for step = 1 : max_iter
        % iterate through every x(i)
        for i = 1 : n
            % new_values_sum represents the first sum of the SOR algorithm
            new_values_sum = A(i, 1 : i - 1) * x(1 : i - 1);
            
            % old_values_sum represents the second sum of the SOR algorithm
            old_values_sum = A(i, i + 1 : n) * x0(i + 1 : n);

            x(i) = (b(i) - (old_values_sum + new_values_sum)) / A(i, i);
            % here we introduce our relaxation parameters
            x(i) = x(i) * w + x0(i) * (1 - w);
        endfor
        % when the new values get close enough to the last values 
        % regarding the imposed tolerance "tol", we reached the solution
        if norm(x - x0) < tol
            break;
        endif
        % update the last computed values with the new values
        x0 = x;
    endfor
endfunction 