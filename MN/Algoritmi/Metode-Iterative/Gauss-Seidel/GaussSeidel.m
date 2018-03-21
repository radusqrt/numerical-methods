function [x step]= GaussSeidel ( A, b, x0, tol, max_iter)
    %use this algorithm only if 
    %max(abs(eig(Ggs))) is < 1
    % G = N^(-1)*P
    % N = tril(A)
    % P = N - A
    
    %for the function to work make sure
    %that b and x0 are column vectors
    
    n=length(b);
    x = x0;
    % iterate through the maximum number of iterations 
    for step = 1 : max_iter
        % iterate through every x(i)
        for i = 1 : n
            new_values_sum = A(i,1:i-1)*x(1:i-1);
            %new_values_sum represents the first sum
            %of the Gauss-Seidel algorithm
            
            old_values_sum = A(i,i+1:n)*x0(i+1:n);
            %old_values_sum represents the second sum
            %of the Gauss-Seidel algorithm
            
            x(i)= (b(i)-(old_values_sum+new_values_sum))/A(i,i);
        endfor
        if norm(x-x0) < tol
            %when the values get close enough to
            %our chosen tolerance we end the function
            break;
        endif
        x0 = x;
    endfor
endfunction 