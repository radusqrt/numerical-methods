% [USES] Algoritmi-ad-hoc/SST

function [x] = GPPS(A, b)
	n = size(A)(1);

	for p = 1 : n - 1
		if p == 1
			continue;
		endif		
		
		max = -inf;	
		for i = p : n
			% calculare factor de scalabilitate
			Si = max(abs(A(i, :)));
		
			% determinare Pmax
			if abs(A(i, p)) / Si > max
				max = abs(A(i, p)) / Si;
				Pmax = i;
			endif
		endfor
		
		% interschimbarea liniilor p si Pmax
		aux = A(p, :);
		A(p, :) = A(Pmax, :);
		A(Pmax, :) = aux;

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
	x = SST(A, b);
endfunction

