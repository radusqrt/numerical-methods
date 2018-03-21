A = [4 12 -16; 12 37 -43; -16 -43 4];

[L success] = Cholesky(A);
if success == 1
	disp(L);
	disp('');
	disp(L');
	disp('');
	disp(L * L');
endif