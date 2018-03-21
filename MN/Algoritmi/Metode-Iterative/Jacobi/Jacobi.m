function [x step] = Jacobi(A, b, x0, tol, max_iter)
    % use this algorithm only if it converges
    
    % sanity checks
    N = diag(diag(A));
    P = N - A;
    Gj = inv(N) * P;
    % calculate the spectral radius of Gj
    sr = max(abs(eig(Gj)));
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
            % val_sum represents the sum of the 
            % Jacobi algortihm and A(i, i) * x0(i) 
            % for which we calculate
            % val_x so that we can 
            % substract it from val_sum
            
            val_sum = A(i, :) * x0(:);
            val_x = A(i, i) * x0(i);
            x(i) = b(i) - (val_sum - val_x);
            x(i) = x(i) / A(i, i);
            
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