% [USES] Algoritmi-ad-hoc/SST

function [x] = GPP(A, b)
	n = size(A)(1);
	for p = 1 : n - 1
		pivot = -inf;
		linie_pivot = -1;
		
		% alegem maximul in modul dintre elementele A(p : n, p)
		[pivot, linie_pivot] = max(abs(A(p : n, p)));
		linie_pivot = linie_pivot + p - 1;

		% interschimbarea liniilor linie_pivot si p in matrice
		if p ~= linie_pivot
			aux = A(p, :);
			A(p, :) = A(linie_pivot, :);
			A(linie_pivot, :) = aux;

			% interschibmarea elementelor in vectorul termenilor liberi
			aux = b(linie_pivot);
			b(linie_pivot) = b(p);
			b(p) = aux;
		endif
		
		% eliminare gaussiana
		for i = p + 1 : n
			if A(p, p) == 0
				continue;
			endif

			factor = A(i, p) / A(p, p);
			% calcularea vectorizata a matricei sistemului si a
			% coloanei termenilor liberi									
			A(i, :) = A(i, :) - factor * A(p, :);
			b(i, :) = b(i, :) - factor * b(p, :);
		endfor
	endfor
	x = SST(A, b);
endfunction
