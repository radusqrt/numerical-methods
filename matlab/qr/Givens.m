% [USES] ad-hoc/SST
function [Q, R, x] = Givens(A, b)
  [m n] = size(A);
  % Gt will be the final rotation matrix (the product of all the others)
  Gt = eye(m);
  % iterate through the elements below the main diagonal
  for k = 1 : n-1
    for l = k+1 : m
      % initialize the matrix for this step
      G = eye(m);

      % calculate cos and sin
      rho = sqrt(A(k, k)^2 + A(l, k)^2);
      c = A(k, k) / rho;
      s = -A(l, k) / rho;

      % modify the rotation matrix
      G(k, k) = c;
      G(k, l) = -s;
      G(l, k) = s;
      G(l, l) = c;

      % eliminate A(l, k)
      A = G * A;
      % add the matrix to the product
      Gt = G * Gt;
     endfor
  endfor
  % the orthogonal matrix is
  % the transpose of the multiplication of all the rotation matrices
  Q = Gt';
  % A becomes the upper triangular matrix
  R = A;

  % Solve the upper triangular system
  % A * x = b => Q * R * x = b => R * x = transpose(Q) * b
  x = SST(R, Q' * b);
endfunction
