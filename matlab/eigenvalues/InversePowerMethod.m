% [USES] lu/Doolittle
function [lambda, y, step] = InversePowerMethod(A, tol, max_iter, miu)
    % Check if it's a square matrix, otherwise there won't be any eigenvalues
    [n m] = size(A);
    if n ~= m
        disp ('Not square matrix')
        return;
    endif

    y = rand(n, 1);
    I = eye(n);
    lambda = inf;

    for step = 1 : max_iter
        % Solving (A - miu * I) * z = y system using Doolittle LU decomposition 
        [L U z] = Doolittle(A - miu * I, y);
    	y = z / norm(z);

        % Update the previous value with the newest one
    	lambda_old = lambda;
        lambda = y' * A * y;

        % When the new values get close enough to the last values
        % regarding the imposed tolerance "tol", we reached the solution
    	if abs((lambda - lambda_old) / lambda) < tol
    		return;
    	endif

    	% Rayleigh quotient iteration in order to increase the convergence speed
    	miu = lambda;
    endfor
endfunction
