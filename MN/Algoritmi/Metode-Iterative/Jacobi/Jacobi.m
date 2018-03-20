function [x]=JBV ( A, b ,x0, tol , max_iter)
    n=length(b); x = x0;
    for step = 1 : max_iter
        % for i = 1 : n
            x(:) = b(:);
            x(:)= x(:) - ((A(:,1:n).*x0(1:n))-A(:,:).*x0(:));
            x(:)= x(:)./A(:,:);
        % endfor
        if norm(x-x0) < tol;
            break;
        endif
        x0 = x;
    endfor
endfunction 