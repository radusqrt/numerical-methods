function [x step] = Sor(A, b, x0, tol, max_iter, w)
    % use this algorithm only if it converges
    if (w >= 2 || w <= 0)
        disp('w apartine (0, 2)');
        step = -1;
        x = NaN;
        return;
    endif
    % sanity checks
    D = diag(diag(A));
    N = (1 / w) * D + tril(A, -1);
    P = tril(A) - A + ((1 / w) - 1) * D ;
    Gs = inv(N) * P;
    % calculate the spectral radius of Gs
    sr = max(abs(eig(Gs)));
    % check if the algorithm converges
    
    if  (sr - 1) >= eps
        x = NaN;
        step = -1;
        disp('Matricea nu converge');
        return;
    endif
    
    % for the function to work make sure
    % that b and x0 are column vectors
    
    n = length(b);
    x = x0;
    % iterate to the maximum number of iterations 
    for step = 1 : max_iter
        % iterate through every x(i)
        for i = 1 : n
            % new_values_sum represents the first sum
            % of the SOR algorithm
            new_values_sum = A(i, 1 : i - 1) * x(1 : i - 1);
            
            % old_values_sum represents the second sum
            % of the SOR algorithm
            old_values_sum = A(i, i + 1 : n) * x0(i + 1 : n);
            x(i) = (b(i) - (old_values_sum + new_values_sum)) / A(i, i);
            % here we introduce our relaxation parameters
            x(i) = x(i) * w + x0(i) * (1 - w);
        endfor
        % when the new values get close 
        % enough to the last values 
        % regarding the imposed tolerance 
        % "tol", we reached the solution
        if norm(x - x0) < tol
            break;
        endif
        % update the last computed 
        % values with the new values
        x0 = x;
    endfor
endfunction 