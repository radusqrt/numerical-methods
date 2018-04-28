function [S] = DirectFFTInterpolation(x, y, z)
	[n] = length(x);
	sizeZ = length(z);
	m = n / 2;
	% we have 2m input points
	a = b = zeros(1, m);
	% the result calculates the function value for each point in z
	S = zeros(1, sizeZ);

	% calculate a0
	a0 = 1/m * sum(y);
	
	for k = 1:m
		% calculate ak and bk

		sumA = sumB = 0;
		for i = 1:2*m
			sumA = sumA + y(i)*cos(k*x(i));
			sumB = sumB + y(i)*sin(k*x(i));
		endfor
		a(k) = sumA / m;
		b(k) = sumB / m;
	endfor

	for i = 1:sizeZ
		sumZ = 0;
		for k = 1:m-1
			sumZ = sumZ + a(k) * cos(k*z(i)) + b(k) * sin(k*z(i));
		endfor
		S(i) = (a0 + a(m)*cos(m*z(i)))/2 + sumZ;
	endfor
endfunction
