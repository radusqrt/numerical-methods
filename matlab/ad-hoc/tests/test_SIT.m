## [USES] ad-hoc/SIT.m

## Test00
%!test
%! tol = [0.000001];

%! A = eye(3);
%! b = ones(3,1);
%! x = ones(3,1);

%! assert(SIT(A,b), x, tol);

## Test01
%!test
## Declare constants 
%! tol = [0.000001];

%! A = [1, 0, 0; 2, 3, 0; 4, 5, 6];
%! b = [1; 2; 3];
%! x = inv(A) * b;

%! assert(SIT(A,b), x, tol);

## Test02
%!test
%! C = rand(3);
%! b = [1; 2; 3];

%! assert(isnan(SIT(C,b)))      #is not inferior triangular

## Test03
%!test
## Declare constants 
%! tol = [0.000001];

%! A = tril(rand(3));
%! b = rand(3,1);
%! x = inv(A) * b;

%! assert(SIT(A,b), x, tol);

## Test04
%!test
## Declare constants 
%! tol = [0.000001];

%! A = tril(rand(5));
%! b = rand(5,1);
%! x = inv(A) * b;

%! assert(SIT(A,b), x, tol);

## Test05
%!test
## Declare constants 
%! tol = [0.000001];

%! A = tril(rand(10));
%! b = rand(10,1);
%! x = inv(A) * b;

%! assert(SIT(A,b), x, tol);

## TODO Add user defined matrix (passed as arguments