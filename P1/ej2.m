clear all
close all
clc

x = [1.7627    4.0571    4.1027    6.1543    7.3821    7.9194    8.9365    9.1690    9.2181    9.3547]';
y = [5.9044   11.4262   15.8872   21.0518   23.0857   26.3197   27.3933   29.9518   31.0830   32.5721]';

% apartado a)
y = 1./(y.*y);
yp = log(y); 
% solucion del problema lineal
sol = polyfit(x,yp,1); 
B = sol(1); C = sol(2); 

% calculamos los parámetros de la exponencial
A = exp(C); 
plot (x,y,'o');
hold on;
plot (x, A*exp((-B)*x), 'r'); hold off;
