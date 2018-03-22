% [USES] Algoritmi-ad-hoc/SST
function [X] = GPT(A, b)
	n = size(A)(1);

	for p = 1 : n - 1
		% Iniatilazam pivotul cu modulul elementului diagonal
		pivot = abs(A(p,p));

		% Initial linia, respectiv coloana corespunzatoare pivotului sunt date de
		% pozitia diagonala
		linie_pivot = p;
		coloana_pivot = p;

		% Aflam maximul in modul dintre elementele matricii determinate de pivotul 
		% initial 
		[pivot, linie_pivot] = max(abs(A(p : n, :)));
		[pivot, coloana_pivot] = max(pivot);
		linie_pivot = linie_pivot + p -1;
		linie_pivot = linie_pivot(coloana_pivot);

		% Interschimbare a liniei initiale a presupusului pivot cu linia elementului
		% ce va fi pivot	
		if p~=linie_pivot
			temp = A(p, :);
			A(p, :) = A(linie_pivot, :);
			A(linie_pivot, :) = temp;
			temp_b = b(p, :);
			b(p, :) = b(linie_pivot, :);
			b(linie_pivot, :) = temp_b;
		endif

		% Interschimbare a coloanei initiale a presului pivot cu cea a elementului
		% ce va fi pivot
		if p~=coloana_pivot
			temp = A(:,p);
			A(:, p) = A(:, coloana_pivot);
			A(:, coloana_pivot) = temp;
		endif

		% Eliminare Gaussiana
		for i = p + 1 : n
			if A(p,p) == 0
				continue;
			endif
			arg = A(i, p) / A(p, p);
			A(i, :) = A(i, :) - arg * A(p, :);
			b(i, :) = b(i, :) - arg * b(p, :);
		endfor
	endfor
	X = SST(A, b)
endfunction




