% [USES] Ad-hoc/SST.m
% [USES] Gauss/G/G.m
function [lambda, y, step] = InversePowerMethod(A, tol, max_iter, miu)
    [n m] = size(A);
    if n ~= m
        disp ('Not square matrix')
        return;
    endif

    y = rand(n, 1);
    I = eye(n);
    lambda = inf;

    for step = 1 : max_iter
        % Solving (A - miu * I) * z = y system using Gauss
        z = G(A - miu * I, y); 
    	y = z / norm(z);

        % Update the previous value with the newest one
    	lambda_old = lambda;
        lambda = y' * A * y;
        
        % When the new values get close enough to the last values
        % regarding the imposed tolerance "tol", we reached the solution
    	if abs((lambda - lambda_old) / lambda) < tol
    		return;
    	endif

    	% Rayleigh quotient iteration
    	miu = lambda;
    endfor
endfunction
