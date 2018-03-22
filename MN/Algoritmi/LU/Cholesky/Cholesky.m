% calculates Cholesky factorization, A = L * L'
% A must be symmetrical and positive-definite

function [L success] = Cholesky (A) 

	[n n] = size(A); % get the size of the matrix A 
	L = zeros(n); % initialize the lower matrix of size N 
	success = 0; % I haven't found the factorization yet
	% I assume I can use Cholesky factorization
	can_apply_Cholesky = 1; 

	if A ~= A'
		% A is not symmetrical
		L = NaN;
		success = 0;
		return;
	endif

	% check if A is positive definite using Sylvester's theorem
	if IsPositiveDefinite(A) == 0
		if IsDiagonalDominant == 0
			can_apply_Cholesky = 0;
		endif
	endif
	
	if can_apply_Cholesky == 0
		L = NaN;
		success = 0;
		return;
	endif 

	% A is positive definite, yay! 
	% calculate the factorization, A = L * L'

    L(1, 1) = sqrt(A(1, 1));
    % calculate only the elements situated under and on the main diagonal
    for i = 1:n
    	for j = 1:i
    		sum = 0;
	    	if i == j
	    		% calculate the sum of the square of the
	    		% previous elements on the same line
	    		for k = 1:j - 1
	    				sum += L(i, k) * L(i, k);
	    		endfor
	   			% calculate an element on the main diagonal
	   			L(i, i) = sqrt(A(i, i) - sum);
	   		else 
	   			for k = 1:j - 1
	   					sum += L(i, k) * L(j, k);
	   			endfor
	   			% calculate the sum of the previous elements on the same line
    			L(i, j) = (A(i, j) - sum) / L(j, j);
    		endif
    	endfor
    endfor
    success = 1;

endfunction
