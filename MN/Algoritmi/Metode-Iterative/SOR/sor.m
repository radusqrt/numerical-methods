function [x]= sorV ( A, b ,x0, tol , max_iter,w)
    n=length(b); x = x0;
    for step = 1 : max_iter
        for i = 1 : n
            x(i) = b(i);
            x(i)= x(i) - ((A(i,1:i-1)*x(1:i-1)) + (A(i,i+1:n)*x0(i+1:n)));
            x(i)=x(i)/A(i,i)*w + x0(i)*(1-w);
        endfor
        if norm(x-x0) < tol;
            break;
        endif
        x0 = x;
    endfor
endfunction 