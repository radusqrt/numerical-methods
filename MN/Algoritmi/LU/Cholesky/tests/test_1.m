A = [25 15 -5; 15 18 0; -5 0 11];
b = [0; 1; 2];

[L U x] = Cholesky(A, b);
disp(L);
disp('');
disp(U);
disp('');
disp(L * U);
disp('');
disp(x);
