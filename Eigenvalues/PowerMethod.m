function [lambda, y, step] = PowerMethod(A, tol, max_iter)
    % This function returns the largest eigenvalue of the matrix and the characteristic vector
    [n n] = size(A);
    % We randomly choose the vector y with values in the interval (0, 1)
    y = rand(n, 1);
    lambda = inf;
    % iterate to the maximum number of iterations
    for step = 1 : max_iter
        z = A * y;
        % update the eigenvector
        y = z / norm(z);
        % backup the last eigenvalue approximation
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