function [x step]=Jacobi ( A, b ,x0, tol , max_iter)
    %use this algorithm only if 
    %max(abs(eig(Ggs))) is < 1
    % G = N^(-1)*P
    % N = diag(diag(A))
    % P = N - A
    
    %for the function to work make sure
    %that b and x0 are column vectors
    
    n=length(b); 
    x = x0;
    for step = 1 : max_iter
        for i = 1 : n
            val_sum = A(i,1:n)*x0(1:n);
            val_x = A(i,i)*x0(i);
            %val_sum represents the sum of the 
            %Jacobi algortihm and A(i,i)*x0(i) 
            %for which we calculate
            %val_x so that we can 
            %substract it from val_sum
            
            x(i)  = b(i) - (val_sum - val_x);
            x(i)  = x(i)/A(i,i);
            
        endfor
        if norm(x-x0) < tol;
            %when the values get close enough to
            %our chosen tolerance we end the function
            break;
        endif
        x0 = x;
    endfor
endfunction 