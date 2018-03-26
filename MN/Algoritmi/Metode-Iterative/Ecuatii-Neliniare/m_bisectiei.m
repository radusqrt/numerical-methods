function [m] = m_bisectiei(f, tol, a, b)

	while 1
		m = (a + b) / 2;
		semn = polyval(f, a) * polyval(f, m);

		% daca produsul este negativ, radacina se afla
		% intre a si m
		if semn < 0
			b = m;
		endif

		% daca produsul este negativ, radacina se afla
		% intre b si m
		if semn > 0
			a = m;
		endif

		% daca produsul este nul, atunci s-a gasit radacina
		if semn == 0
			return;
		endif

		% in caz ca nu s-a gasit radacina se calculeaza noul m
		new_m = (a + b) / 2;

		% daca eroarea relativa este mai mica decat toleranta
		% m va deveni cea mai apropiata valoare de radacina/ radacina
		% si se va iesi din bucla
		eroare_rel = abs ((new_m - m) / new_m);
		if eroare_rel < tol
			m =  new_m;
			return;
		endif
	endwhile

endfunction
