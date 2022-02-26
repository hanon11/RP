function [in, out] = circle(n)
% circle - Un circulo en un cuadrado de lado unidad
%
%  Dos clases
%      C0 = dentro del cirsulo
%      C1 = fuera del circulo
%
%      [in, out] = circle(n)
%
  in = 2 * rand(2,n) - 1;
  out = (sum(in.*in) <= 2 / pi); 
end

