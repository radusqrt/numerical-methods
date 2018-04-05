function [Ai] = inverse(A, miu, I)
	% example of inverting using LU here:
	% https://www.youtube.com/watch?v=dza5JTvMpzk
	[L U] = lu(A - miu * I);

	z1 = L \ [1; 0; 0];
    col1 = U \ z1;
    z2 = L \ [0; 1; 0];
    col2 = U \ z2;
    z3 = L \ [0; 0; 1];
    col3 = U \ z3;

    Ai = [col1 col2 col3];
    return;