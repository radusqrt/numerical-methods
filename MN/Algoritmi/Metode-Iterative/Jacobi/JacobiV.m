function [x]=JacobiV ( A, b ,x0, tol , max_iter)
    n=length(b); x = x0;
    for step = 1 : max_iter
        for i = 1 : n
            x(i) = b(i);
            x(i)= x(i) - ((A(i,1:n)*x0(1:n))-A(i,i)*x0(i));
            x(i)= x(i)/A(i,i);
        endfor
        if norm(x-x0) < tol;
            break;
        endif
        x0 = x;
    endfor
endfunction 