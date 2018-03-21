function [L, U] = crout(A)
	n = length(A);
	L = zeros(n);
	U = eye(n);

	L(1 : n, 1) = A(1 : n, 1);

	for p = 1 : n
		for i = p : n
			s = 0;
			for k = 1 : p - 1
				s = s + L(i , k) * U(k, p);
			endfor

			L(i, p) = A(i, p) - s;
		endfor

		for j = p + 1 : n
			s = 0;
			for k = 1 : p - 1
				s = s + L(p, k) * U(k, j);
			endfor

			U(p, j) = (A(p, j) - s) / L(p, p);
		endfor
	endfor
endfunction