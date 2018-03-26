function [x, i] = MetodaTangentei(p, x0, tol, max_iter)
	% solves f(x) = 0 by doing max_iter steps;
	% the method requires one initial value (x0)
	% which should be chosen close to the root;
	% y = polyval(p, x) returns the value of a polynomial evaluated at x;
	% y = polyder(p) returns the coefficients of the derivative of the polynomial 
	% whose coefficients are given by the vector p;
	fd = polyder(p);
	for i = 1 : max_iter 		
		fx = polyval(p, x0);
		fxd = polyval(fd, x0);
		% Calculate the value of xi using the formula;
		xi = x0 - fx / fxd;
		% Calculate the value of polynomial evaluated at xi;
		fxi = polyval(p, xi);
		% xi is the solution;
		if abs(fxi) < eps
			x = xi;
			return;
		endif
        
		epsilon = abs((xi - x0) / xi);
        % stop if the method reached its convergence limit;
		if epsilon < tol
			x = xi;
			return;
		endif

		% update the last computed value;
		x0 = xi;
	endfor
	disp('Maximum number of iterations reached');
endfunction