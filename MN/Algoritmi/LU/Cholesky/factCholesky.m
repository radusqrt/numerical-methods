A = [25 15 -5; 15 18 0; -5 0 11];

[L success] = Cholesky(A);
if success == 1
	disp(L);
	disp('');
	disp(L');
	disp('');
	disp(L * L');
endif
