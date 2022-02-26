clear all
close all
clc

x = [6.1543 7.9194 9.2181 7.3821 1.7627 4.0571 9.3547 9.1690 4.1027 8.9365]';
y = [21.0518 23.0857 31.0830 27.3933 5.9044 15.8872 32.5721 26.3197 11.4262 29.9518]';
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
plot (x,A*-(exp(B*x)),'r'); hold off;
