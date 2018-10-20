function [] = Bezier(v, dim)
  result = zeros(dim, 2);
  i = 1;
  for u = linspace(0,1,dim) 
    result(i,:) = deCasteljau(v, length(v) - 1, 0, u);
    i++;
  endfor
 
 plot (result(1:dim,1), result(1:dim,2), 'r','LineWidth',2)
 hold
 plot(v(:,1), v(:,2),'LineWidth',2)
 title('Bezier Curve for given points')
endfunction