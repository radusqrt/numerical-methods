% [USES] ad-hoc/plotGershgorin
A = [5 1 2 17; 2 1 4 8; 2 1 34 4; 10 1 2 5];
B = [-3 -1 2 14; 5 -4 3 1; 2 3 -4 1; 2 1 16 4];

eigA = eig(A)
plotGershgorin(A);

eigB = eig(B)
plotGershgorin(B);
