## [USES] ad-hoc/IsPositiveDefinite.m

## Test00
%!test 
%! A = eye(3);
%! assert(IsPositiveDefinite(A) ,1)

## Test01
%!test
%! A = [73, 42, 21; 16, 32, 89; 21, 45, 96];
%! assert(IsPositiveDefinite(A), 0)

## Test02
%!test
%! A = [2, -1, 0; -1, 2, -1; 0, -1, 2];
%! assert(IsPositiveDefinite(A), 1)
