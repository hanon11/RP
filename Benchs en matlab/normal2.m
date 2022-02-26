function [in, out] = normal2(n)
% normal2 - Problema de las dos normales
% devuelve un conjunto de n patrones pertenecientes a 
% dos normales con varianza unidad y centro en (-1,0) y (1,0)
%
%    [in,out]=normal2(n);
%  

  n = ceil(n/2);

  in = randn(2,n)+[-1;0] * ones(1,n);
  in = [in randn(2,n) + [1;0] * ones(1,n)];
  out = [zeros(1,n) ones(1,n)];

  [in,out] = unsort(in,out);
  
end