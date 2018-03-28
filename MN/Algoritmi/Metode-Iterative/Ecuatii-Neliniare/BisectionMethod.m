function [x, i] = BisectionMethod(f, a, b, tol, max_iter)
	% solves the equation f(x) = 0 for the real variable x
	% in i steps from the total number of iterations max_iter;
	% the method requires a continuous function f;
	% the function is defined on a given interval [a, b];
	% f(a) and f(b) have opposite signs;
	for i = 1 : max_iter
		% calculate the midpoint
		x = (a + b) / 2;
		fact = feval(f, a) * feval(f, x);

		% if the product is negative, the root is in 
		% between a and x
		if fact < 0
			b = x;
		% if the product is positive, the root is in 
		% between b and x
		elseif fact > 0
			a = x;
		% if the product is null, the root is found
		else
			return;
		endif
		
		% if the root is unknown, the new midpoint is calculated
		new_x = (a + b) / 2;
		
		% if the relative absolute error is lower than the given tolerance,
		% then the bisection method reached convergence limit
		err = abs((new_x - x) / new_x);
		if err < tol
			x =  new_x;
			return;
		endif
	endfor
endfunction
