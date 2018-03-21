function [A b] = GPP(A, b)
	n = size(A)(1);
	for p = 1 : n -1
		pivot = -inf;
		linie_pivot = -1;
		
		% maximul dintre elementele A(p : n, p)
		for i = p : n
			if pivot < abs(A(i, p));
				pivot = abs(A(i, p));
				linie_pivot = i;
			endif
		endfor

		% interschimbarea liniilor linie_pivot si p in matrice
		if p ~= linie_pivot
			for j = p : n 
				aux = A(p, j);
				A(p, j) = A(linie_pivot, j);
				A(linie_pivot, j) = aux;
			endfor

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

			factor = A(i, p)/A(p, p);
			% calcularea vectorizata a matricei sistemului si a
			% coloanei termenilor liberi									
			A(i, :) = A(i, :) - factor * A(p, :);
			b(i, :) = b(i, :) - factor * b(p, :);
		endfor
	endfor
endfunction
