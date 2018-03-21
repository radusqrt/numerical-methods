function [A, b] = G(A, b)
	n = size(A)(1);
	for p = 1 : n - 1
		for i = p + 1 : n	
			factor = A(i, p) / A(p, p);
			% calcularea vectorizata a matricei sistemului si a
			% coloanei termenilor liberi									
			A(i, :) = A(i, :) - factor * A(p, :);
			b(i, :) = b(i, :) - factor * b(p, :);
		endfor
	endfor
endfunction
