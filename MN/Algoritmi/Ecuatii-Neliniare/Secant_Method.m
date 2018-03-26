function [x] = Secant_Method(xn_2, xn_1, tol, p, max_iter)
    % Solves f(x) = 0 by doing max_iter steps of the secant method
    % the secant method requires two initial values, xn_1 and xn_2
    % which should ideally be chosen close to the root
    % y = polyval(p, x) returns the value of a polynomial evaluated at x
    for i = 1 : max_iter
        % function values
        f_xn_2 = polyval(p, xn_2);
        f_xn_1 = polyval(p, xn_1);

        % the root of function f is approximated using the formula 
        xn = xn_2 - f_xn_2 * (xn_2 - xn_1) / (f_xn_2 - f_xn_1);

        % calculate f(xn)
        f_xn = polyval(p, xn);

        % xn is the solution
        if f_xn == 0
            x = xn;
            return;
        endif

        % calculate eps
        eps = abs((xn - xn_2) / xn);

        % is achieved a sufficient degree of accuracy eps
        if eps < tol
            x = xn;
            return;
        endif

        % the new values for the next step
        xn_1 = xn_2;
        xn_2 = xn;
    endfor
endfunction