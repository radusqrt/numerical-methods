function [L, U, x] = Doolittle(A, b)
	n = length(A);
	L = eye(n);
	U = zeros(n);

	for i = 1 : n
		sum_for_U = L(i , 1 : (i - 1)) * U(1 : (i - 1), i : n);
		U(i, i : n) = A(i, i : n) - sum_for_U;
	
		sum_for_L = L((i + 1) : n, 1 : (i - 1)) * U(1 : (i - 1), i);
		L((i + 1) : n, i) = (A((i + 1) : n, i) - sum_for_L) / U(i, i);
	endfor

	y = SIT(L, b);
	x = SST(U, y);
endfunction
