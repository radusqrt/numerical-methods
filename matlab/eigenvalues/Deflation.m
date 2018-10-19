% [USES] Eigenvalues/PowerMethod, Eigenvalues/InversePowerMethod
function [L, V] = Deflation(A, max_iter, tol)
  [n n] = size(A);
  % initialize the eigenvalues' vector
  L = zeros(1, n);
  % initialize the eigenvectors' matrix
  V = zeros(n);
  % save a backup for A
  C = A;

  for k = 1 : n - 1
  % get the current eigenvalue
    [lam y] = PowerMethod(A, tol, max_iter);
    L(k) = lam;
    V(:, k) = y;
    
    % compute Wielandt deflation vector
    x = A(k, :)' / (lam * y(k));
    
    % remove the dominant eigenvalue and its
    % eigenvector from the current matrix
    B = A - lam * y * x';
    A = B;
  endfor
  
  % get the last eigenvalue
  [lam y] = PowerMethod(A, tol, max_iter);
  L(n) = lam;
  V(:, n) = y;
  
  % the eigenvectors are not very precise, so
  % we use Inverse Power Method to find a better set of eigenvectors
  % because we know the eigenvalues
  for k = 1 : n
    [lam y] = InversePowerMethod(C, tol, max_iter, L(k));
    V(:, n) = y;
  endfor
endfunction
