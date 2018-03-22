% [USES] Algoritmi-ad-hoc/SST

function [x] = G(A, b)
	n = size(A)(1);
	for p = 1 : n - 1
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
