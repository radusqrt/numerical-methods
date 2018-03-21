function [A b] = GPPS(A, b)
	n = size(A)(1);
	Si = -inf;

	for p = 1 : n -1
		for i = p : n
			if p == 1
				continue
			endif
			
			% calculare factor de scalabilitate
			for j = 1 : n
				if abs(A(i, j)) > Si
					Si = abs(A(i, j));
				endif
			endfor
		endfor
		
		max = -inf;

		for i = p : n
			if abs(A(i, p)) / Si > max
				max = abs(A(i, p)) / Si;
				Pmax = i;
			endif
		endfor
		
		% interschimbarea liniilor p si Pmax
		for j = p : n 
				aux = A(p, j);
				A(p, j) = A(Pmax, j);
				A(Pmax, j) = aux;
		endfor

		% interschibmarea elementelor in vectorul termenilor liberi
		aux = b(Pmax);
		b(Pmax) = b(p);
		b(p) = aux;
		
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
endfunction
