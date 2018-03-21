% calculates Cholesky factorization, A = L*L'
% A must be symmetrical and positive-definite

function [L success] = Cholesky (A) 

	% get the size of the matrix A 
	[n n] = size(A);
	% initialize the lower matrix of size N 
	L = zeros(n);
	% I haven't found the factorization yet
	success = 0;

	if A ~= A'
		% A is not symmetrical
		return;
	endif

	% check if A is positive-definite by checking if it is diagonally dominant
	OK = 1; %I assume it is positive-definite

	for i = 1:n
		if A(i, i) < 0
			OK = 0;
			break;
		endif
		% calculate the sum of the elements on line i, except A(i, i)
		sum = 0;
		for k = 1:n
			sum += A(i, k);
		endfor
		sum = sum - A(i, i);

		if A(i, i) < sum
			OK = 0;
			break;
		endif
	endfor

	if OK == 0
		% try with another method to see A is positive-definite
		% check if A is positive-definite by using Sylvester's theorem
		OK = 1; %I assume it is positive-definite
		for i = 1:n
			B = A(0 : i, 0 : i);
			if det(B) < 0
				OK = 0;
				break;
			endif
		endfor
	endif

	if OK == 0
		return;
	endif

	% A is positive definite, yay! 
	% calculate the factorization, A = L * L'

    L(1, 1) = sqrt(A(1, 1));
    % calculate onlt the elements situated under and on the main diagonal
    for i = 1:n
    	for j = 1:i
    		sum = 0;
	    	if i == j
	    		%calculate the sum of the square of the previous elements on the same line
	    		for k = 1:j - 1
	    				sum += L(i, k) * L(i, k);
	    		endfor
	   			%calculate an element on the main diagonal
	   			L(i, i) = sqrt(A(i, i) - sum);
	   		else 
	   			for k = 1:j - 1
	   					sum += L(i, k) * L(j, k);
	   			endfor
	   			%calculate the sum of the previous elements on the same line
    			L(i, j) = (A(i, j) - sum)/L(j, j);
    		endif
    	endfor
    endfor

    success = 1;

endfunction