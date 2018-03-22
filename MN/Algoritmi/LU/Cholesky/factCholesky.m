A = [25 15 -5; 15 18 0; -5 0 11];
b = [0, 1, 2];

[L U x success] = Cholesky(A, b);
if success == 1
	disp(L);
	disp('');
	disp(U);
	disp('');
	disp(L * U);
    disp('');
    disp(x);
endif
