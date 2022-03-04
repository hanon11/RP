clear all
close all
clc

x = [1.7627    4.0571    4.1027    6.1543    7.3821    7.9194    8.9365    9.1690    9.2181    9.3547]';
y = [5.9044   11.4262   15.8872   21.0518   23.0857   26.3197   27.3933   29.9518   31.0830   32.5721]';

% apartado a)
ya = 1./(y.*y);
yp = log(ya); 
% solucion del problema lineal
sol = polyfit(x,yp,1);
B = sol(1); C = sol(2); 

% calculamos los parámetros de la exponencial
A = exp(C); 
plot (x,ya,'o');
estimacion = A * exp(-B*x);

hold on;
plot (x, estimacion, 'r');

% apartado b)
x2 = x/10;
yb = 3*x2.*exp(2*x2)+rand(size(x2));
ybp = log(yb);
plot(x2,yb,'*');
sol = polyfit(x2,ybp,1);
B = sol(1); A = sol(2);
C = exp(A);
estimacion = C.*x2.*exp(B*x2);
plot (x2, estimacion, 'b');
hold off;
legend('Puntos a)', 'Recta a)', 'Puntos b)', 'Recta b)');
