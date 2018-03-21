function [x] =  SIT(A, b)
	% if the matrix is not lower triangular, we cannot solve the system
    % tril(A, -1) gets us what is strictly under the main diagonal
    % max(matrix) gets us a list of every column's max
    % max(list) gets us the maximum from the list

    if max(max(abs(tril(A', -1)))) > eps
    	disp('The matrix A is not lower triangular!');
        x = NaN;
        return;
    endif

	n = length(b);

	% initialize x with zeros
	x = zeros(n, 1);

	x(1) = b(1) / A(1, 1);

	% calculate x(i) forwards
	for i = 2 : n
		sum_of_xs = A(i, 1 : (i - 1)) * x(1 : (i - 1), 1);
		x(i) = (b(i) - sum_of_xs) / A(i, i);
	endfor
endfunction