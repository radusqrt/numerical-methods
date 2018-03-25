function mat = GramSchimidt(mat)
  k = size(mat, 2);
  assert(k >= 2, 'The input matrix must include more than one vector.');
  for i = 1 : 1 : k
    mat(:, i) = mat(:, i) / norm(mat(:, i));
    for j = i + 1 : 1 : k
      mat(:, j) = mat(:, j) - proj(mat(:, i), mat(:, j));
    endfor
  endfor
  function w = proj(a, b)
    w = (dot(b, a) / dot(a, a)) * a
  endfunction
endfunction
