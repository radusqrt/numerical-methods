## [USES] ad-hoc/IsDiagonallyDominant.m

## Test00
%!test
%! A = eye(3);
%! assert(IsDiagonallyDominant(A) ,1)

## Test01
%!test
%! A = [73, 42, 21; 16, 32, 89; 21, 45, 96];
%! assert(IsDiagonallyDominant(A), 0)

## Test02
%!test
%! A = [65, 22, 35; 11, 64, 28; 43, 82, 178];
%! assert(IsDiagonallyDominant(A), 1)

