% [USES] ad-hoc/SST
function [Q, R, x] = GramSchmidt(A, b)
  [m n] = size(A);
  Q = [];
  % iterate through every column for calculating the orthogonal matrix Q
  for k = 1 : n
    % initialize q with the current column from A and keep a copy of it
    q = A(1 : m, k);
    temp = q;
    for j = 1 : k-1
      % calculate the scalar product
      sp = sum(temp .* Q(:, j));
      % create orthogonal vectors
      q = q - sp * Q(1 : m, j);
    endfor
    % normalize the vector
    q = q / norm(q);
    % add it to the matrix
    Q = [Q q];
  endfor

  % the upper triangular matrix will be transpose(Q) * A
  R = Q' * A;

  % solve the system
  % A * x = b => Q * R * x = b => R * x = transpose(Q) * b
  x = SST(R, Q' * b);
endfunction
