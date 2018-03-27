function [x i] = BisectionMethod(f, a, b, tol, max_iter)
	for i = 1 : max_iter
		x = (a + b) / 2;
		fact = feval(f, a) * feval(f, x);

		% if the product is negative, the root is in 
		% between a and m
		if fact < 0
			b = x;

		% if the product is negative, the root is in 
		% between b and x
		elseif fact > 0
			a = x;

		% if the product is null, the root is found
		else
			return;
		endif

		% if the root is unknown, the new_m is calculated
		new_x = (a + b) / 2;

		% if the relative absolute error is lower than tolerance,
		% bisection method reached convergence limit
		err = abs((new_x - x) / new_x);
		if err < tol
			x =  new_x;
			return;
		endif
	endfor
endfunction
