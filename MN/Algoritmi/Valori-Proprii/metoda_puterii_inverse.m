function [lambda, step] = metoda_puterii_inverse(A, tol, miu, max_iters)
    [n m] = size(A);
    if n ~= m
        disp 'Not square matrix'
        return;
    endif

    y = rand(n, 1);
    I = eye(n);

    lambda = inf;

    for step = 1 : max_iters
        % Solvind z = inv(A - miu * I) * y by
        % inverting matrix using LU factorization
        Ai = inverse(A, miu, I);
        z = Ai * y;
    	y = z / norm(z);
        % Update the previous value with the newest one
    	lambda_old = lambda;
        lambda = y' * A * y;
        % The algorithm stops when a value with a
        % small enough error is found
    	if abs((lambda - lambda_old) / lambda) < tol
    		return;
    	endif
    	miu = lambda;
    endfor
endfunction
