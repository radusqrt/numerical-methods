% [USES] Algoritmi-ad-hoc/SST
function [Q R x] = GramSchmidt (A, b)
  [m n] = size(A);
  
  % iterate through every column for calculating the orthogonal matrix Q
  for k = 1 : n
    % initialize q with the current column from A and keep a copy of it
    q = A(1 : m, k); 
    a = q;
    for j = 1 : k-1
      % initialize the scalar product with 0
      sp = 0;
      for i = 1 : m
        % calculate the scalar product
        sp = sp + a(i) * Q(i, j);
      endfor
      % create orthogonal vectors
      q = q - sp * Q(1 : m, j);
    endfor
    % orthonormalize the vector
    q = q / norm(q);
    % add it to the matrix
    Q(1 : m, k) = q;
  endfor
  
  % the upper triangular matrix will be transpose(Q) * A
  R = Q' * A;
  
  % solve the system
  % A * x = b => Q * R * x = b => R * x = transpose(Q) * b
  x = SST(R, Q' * b);
endfunction
