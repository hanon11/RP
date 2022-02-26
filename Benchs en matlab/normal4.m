function [in, out] = normal4(n) 
% normal4 - Problema de las cuatro normales
% devuelve un conjunto de n patrones pertenecientes a 
% cuatro normales con varianza unidad y centro en (+/- 1.5, +/- 1.5)
% La tasa de error bayesiana es del 12.9 por ciento.
%
%    [in,out]=normal4(n);
%  
  n = ceil (n / 4);

  in = randn(n,2) + ones(n, 1) * [1.5 1.5]; 
  in = [in; randn(n,2) + ones(n,1) * [-1.5 -1.5] ];
  in = [in; randn(n,2) + ones(n,1) * [1.5 -1.5] ];
  in = [in; randn(n,2) + ones(n,1) * [-1.5 1.5] ];
  
  out = zeros(n,1);
  out = [ out; ones(n,1)];
  out = [ out; ones(n,1) * 2 ];
  out = [ out; ones(n,1) * 3 ];
  
  k = rand(4*n,1);
  [dummy,kind] = sort(k);
  
  in = in(kind,:)';
  out = out(kind,:)';
  
end
