function [x step] = GaussSeidel(A, b, x0, tol, max_iter)
    % use this algorithm only if it converges
    N = tril(A);
    P = N - A;
    Ggs = inv(N) * P;
    % calculate the spectral radius of Ggs
    sr = max(abs(eig(Ggs)));
    % check if the algorithm converges
    if  (sr - 1) >= eps
        x = NaN;
        step = -1;
        disp('Matrix does not converge');
        return;
    endif

    n = length(b);
    x = x0;
    % iterate to the maximum number of iterations
    for step = 1 : max_iter
        % iterate through every x(i)
        for i = 1 : n
            % compute the sum using the updated values from the current step
            new_values_sum = A(i, 1 : i - 1) * x(1 : i - 1);

            % compute the sum using the previous step values
            old_values_sum = A(i, i + 1 : n) * x0(i + 1 : n);

            x(i) = b(i) - (old_values_sum + new_values_sum);
            x(i) = x(i) / A(i, i);
        endfor

        % when the new values get close enough to the last values
        % regarding the imposed tolerance "tol", we reached the solution
        if norm(x - x0) < tol
            break;
        endif
        % update the last computed values with the new values
        x0 = x;
    endfor
endfunction 