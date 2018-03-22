% checks if a matrix A is positive definite using Sylvester's theorem

function is_pos_def = IsPositiveDefinite(A)

	[n n] = size(A);

	is_pos_def = 1; % I assume it is positive-definite
	for i = 1 : n
		B = A(1 : i, 1 : i);
		if det(B) < 0
			is_pos_def = 0; % turns out it is not positive-definite
			break;
		endif
	endfor

endfunction
