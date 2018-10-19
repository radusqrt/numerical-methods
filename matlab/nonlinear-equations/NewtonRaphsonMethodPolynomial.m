function [x, i] = NewtonRaphsonMethodPolynomial(f, x0, tol, max_iter)
    % solves f(x) = 0 by doing max_iter steps;
    % the method requires one initial value (x0)
    % which should be chosen close to the root;
    % y = polyval(f, x) returns the value of a polynomial evaluated at x;
    % y = polyder(f) returns the coefficients of the derivative of the polynomial 
    % whose coefficients are given by the vector p;
    fd = polyder(f);
    for i = 1 : max_iter        
        fx = polyval(f, x0);
        fxd = polyval(fd, x0);
        % calculate the value of the new approximation, xi, using the formula;
        xi = x0 - fx / fxd;
        % calculate the value of the polynomial evaluated at xi;
        fxi = polyval(f, xi);
        % check if xi is a root of the polynomial;
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
