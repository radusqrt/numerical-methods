function [m] = bisection_method(f, tol, a, b)
	while 1
		m = (a + b) / 2;
		fact = polyval(f, a) * polyval(f, m);

		% if the product is negative, the root is in 
		% between a and m
		if fact < 0
			b = m;
		endif

		% if the product is negative, the root is in 
		% between a and m
		if fact > 0
			a = m;
		endif

		% if the product is null, the root is found
		if fact == 0
			return;
		endif

		% if the root is unknown, the new_m is calculated
		new_m = (a + b) / 2;

		% if the error is lower than tolerance, m becomes the solutions
		err = abs ((new_m - m) / new_m);
		if err < tol
			m =  new_m;
			return;
		endif
	endwhile
endfunction
