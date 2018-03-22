% checks if a matrix A is diagonally dominant 

function is_diag_dom = IsDiagonallyDominant(A)

	[n n] = size(A);
	is_diag_dom = 1; % I assume it is diagonally dominant

	for i = 1 : n
		if A(i, i) < 0
			is_diag_dom = 0; %turns out it is not diagonally dominant
			break;
		endif

		% calculate the sum of the elements on line i, except A(i, i)
		sum = 0;

		for k = 1 : n
			sum += A(i, k);
		endfor
		sum = sum - A(i, i);

		if A(i, i) < sum
			is_diag_dom = 0;
			break;
		endif
	endfor

endfunction
