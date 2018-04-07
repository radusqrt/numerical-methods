function [L, V] = Deflatie(A, max_iter, tol)
	[n n] = size(A);
	L = zeros(1, n);
	V = zeros(n);
  C = A;

	for k = 1 : n - 1
  % getting the current eigenvalue
    [lam y nr] = PutereDirecta(A, max_iter, tol);
    L(k) = lam;
    V(:, k) = y;
    
    % calculating the next matrix
    x = A(k, :)'/ (lam * y(k));
    B = A - lam * y * x';
    A = B;
	endfor
  
  % getting the last eigenvalue
  [lam y nr] = PutereDirecta(A, max_iter, tol);
  L(n) = lam;
  V(:, n) = y;
  
  % the eigenvectors are not very precise, so
  % we use Inverse Power method to find a better set of eigenvectors
  % because we know the eigenvalues
  for k = 1 : n
    [lam y nr] = PutereInversa(C, max_iter, tol, L(k));
    V(:, n) = y;
  endfor
endfunction
