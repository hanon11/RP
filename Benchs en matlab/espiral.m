function [in, out]=espiral(n,m,s);
% espiral - Problema de las dos espirales
% [in,out] = espiral(n,m,s)   
% % Numero de clases = 2
%
% Las clases consisten en espirales con n puntos por ciclo
% y m ciclos. Por tanto, el numero total de patrones generados
% es de 2 * n * m
%
% El parametro s es el ruido gaussiano añadido con varianza s^2, y perpendicular
% a la direccion de la espiral.

  if (nargin == 2)
    s = 0;
  end
  
  N = m*n; 
  t = (1:N)'/n;
  
  x = (2*t+1).*cos(2*pi*t)/3;
  y = (2*t+1).*sin(2*pi*t)/3;
 
  if (s ~= 0)
    e=s*randn(N,1);
    xs = cos(2*pi*t)-pi*(2*t+1).*sin(2*pi*t);
    ys = sin(2*pi*t)+pi*(2*t+1).*cos(2*pi*t); 
    sumsq = [xs ys]';
    sumsq = sum(sumsq.*sumsq);
    nrm = sqrt(sumsq)';
    xs = xs./nrm;
    ys = ys./nrm;
    x = x + e.*ys;
    y = y - e.*xs;
  end
 
  in = [x y]';
  in = [in -in];
  out = [zeros(1,n*m) ones(1,n*m)];

  [in,out]=unsort(in,out);

end