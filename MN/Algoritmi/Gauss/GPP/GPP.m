% [USES] Algoritmi-ad-hoc/SST
function [x success] = GPP(A, b)
	% creez matricea extinsa pentru a reduce numarul de operatii
	Ae = [A b];		
	n = size(Ae)(1);
	for p = 1 : n - 1
		pivot = -inf;
		linie_pivot = -1;
		
		% alegem maximul in modul dintre elementele Ae(p : n, p)
		[pivot, linie_pivot] = max(abs(Ae(p : n, p)));
		linie_pivot = linie_pivot + p - 1;

		% interschimbarea liniilor linie_pivot si p in matricea extinsa
		if p ~= linie_pivot
			aux = Ae(p, :);
			Ae(p, :) = Ae(linie_pivot, :);
			Ae(linie_pivot, :) = aux;
		endif
		
		% verific daca pot aplica metoda
		if Ae(p, p) == 0
			success = 0;
			x = Nan;
			return;
		endif

		% eliminare gaussiana
		for i = p + 1 : n
			factor = Ae(i, p) / Ae(p, p);
			% eliminarea elementelor de sub diagonala principala pe coloana p								
			Ae(i, :) = Ae(i, :) - factor * Ae(p, :);
		endfor
	endfor

	% reconstruiesc matricea A si coloana termenilor liberi
	A = Ae(1 : n, 1 : n);
	b = Ae(1 : n, n + 1);
	% dupa ce am adus sistemul la forma triunghiular superioara, aplicam SST
	% pentru a afla solutiile sistemului initial
	x = SST(A, b);
endfunction
