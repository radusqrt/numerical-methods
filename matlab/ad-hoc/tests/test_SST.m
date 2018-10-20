## [USES] ad-hoc/SST.m

## Declare constants 
tol = [0.000001];

## Test00
A = eye(3);
b = ones(3,1);
x = ones(3,1);
assert(!isnan(SST(A,b)))
assert(SST(A,b), x, tol)

## Test01
A = [1, 2, 3; 0, 4, 5; 0 0 9];
b = [1 2 3]';
x = [-0.166667; 0.083333; 0.333333];

assert(!isnan(SST(A,b)))
assert(SST(A,b), x, tol)

## Test02
C = rand(3);
d = rand(3, 1);

assert(isnan(SST(C,b)))     #is not triang

## Test03
E = triu(rand(3));
g = rand(3,1);
z = inv(E) * g;

assert(!isnan(SST(E,g)))
assert(SST(E,g), z, tol)

## Test04
E = out = triu(rand(5));
g = rand(5,1);
z = inv(E) * g;

assert(!isnan(SST(E,g)))
assert(SST(E,g), z, tol)

## Test05
E = out = triu(rand(10));
g = rand(10,1);
z = inv(E) * g;

assert(!isnan(SST(E,g)))
assert(SST(E,g), z, tol)

## TODO Add user defined matrix (passed as arguments)