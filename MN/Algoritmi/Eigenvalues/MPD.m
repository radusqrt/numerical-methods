function [lambda y step] = MPD(A, tol, max_iter)
    % This function returns the largest eigenvalue of the matrix and the characteristic vector
    [n n] = size(A);
    % We randomly chose the vector y with values in the interval (0, 1)
    y = rand(n, 1);
    lambda = inf;

    % iterate to the maximum number of iterations
    for step = 1 : max_iter
        z = A * y;
        % update the y vector
        y = z / (norm(z));
        % update the last computed value with the new value
        lambda_old = lambda;
        % update the lambda value
        lambda = y' * A * y;
        % when the new values get close enough to the last values 
        % regarding the imposed tolerance "tol", we reached the solution
        if abs((lambda - lambda_old) / lambda) < tol
            break;
        endif
    endfor
endfunction