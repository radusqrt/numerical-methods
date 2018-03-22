% calculates Cholesky factorization, A = L * L'
% A must be symmetrical and positive-definite
function [L U x success] = Cholesky (A, b) 

	[n n] = size(A); % get the size of the matrix A 
	L = zeros(n); % initialize the lower matrix of size N 
	success = 0; % I haven't found the factorization yet
	% I assume I can use Cholesky factorization
	can_apply_Cholesky = 1; 
	if A ~= A'
		% A is not symmetrical
		L = NaN;
		U = NaN;
		x = NaN;
		success = 0;
		return;
	endif

	% check if A is positive definite 
	if IsPositiveDefinite(A) == 0
		can_apply_Cholesky = 0;
	endif

	for i = 1 : n
		if A(i, i) < 0
			can_apply_Cholesky = 0;
			break;
		endif
	endfor
	
	if can_apply_Cholesky == 0
		L = NaN;
		U = NaN;
		x = NaN;
		success = 0;
		return;
	endif 

	% A is positive definite, yay! 
	% calculate the factorization, A = L * L'

    L(1, 1) = sqrt(A(1, 1));
    % calculate only the elements situated under and on the main diagonal
    for i = 1:n
    	for j = 1:i
    		sum_of_line = 0;
	    	if i == j
	    		sum_of_line = sum(L(i, 1:j - 1) .^ 2);
	   			% calculate an element on the main diagonal
	   			L(i, i) = sqrt(A(i, i) - sum_of_line);
	   		else 
	   			sum_of_line = sum(L(i, 1: j - 1) .* L(j, 1: j - 1));
	   			% calculate the sum of the previous elements on the same line
    			L(i, j) = (A(i, j) - sum_of_line) / L(j, j);
    		endif
    	endfor
    endfor
    success = 1;
    U = L';

    % L * (U * x) = b
    y = SST(L, b);
    x = SIT(U, y);

endfunction
