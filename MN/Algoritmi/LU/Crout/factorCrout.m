function [L U] = factorCrout(A)
	n = length(A);
	L = zeros(n,n);
	U = diag(ones(n,1));
	for p = 1: n
		L(p:n, p) = A(p:n, p) - L(p:n, 1:p-1) * U(1:p-1,p);
		L;
		if p == n
			break
		endif
		U(p, p+1:n) = (A(p, p+1:n) - L(p, 1:p-1) * U(1:p-1, p+1:n)) / L(p,p);
		U;
	endfor
