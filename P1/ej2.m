clear all
close all
clc
%rand('seed',0); randn('seed',0); 

x = [6.1543 7.9194 9.2181 7.3821 1.7627 4.0571 9.3547 9.1690 4.1027 8.9365]';
y = [21.0518 23.0857 31.0830 27.3933 5.9044 15.8872 32.5721 26.3197 11.4262 29.9518]';

sorted_ = sortrows([x y]);
x = sorted_(:,1);
y = sorted_(:,2);

% apartado a)
ya = 1./(y.*y);
yp = log(ya); 
% solucion del problema lineal
sol = polyfit(x,yp,1);
B = -sol(1); C = sol(2); 

% calculamos los parámetros de la exponencial
A = exp(C); 
figure;
plot (x,ya,'o');
estimacion = A * exp(-B*x);

hold on;
plot (x, estimacion, 'r');
hold off;


% apartado b)
% nuevo conjunto de datos
x2 = x./10;
y2 = 3*x2.*exp(2*x2)+rand(size(x2));
ybp = log(y2./x2);

% pintamos puntos
figure;
plot(x2,y2,'ob');

% pseudoinversa
A = [x2 ones(length(x2),1)];
sol = pinv(A)*ybp;
b = sol(1); c = sol(2);
a = exp(c);
estimacion2 = a.*x2.*exp(b*x2);

%terminamos de pintar
hold on;
plot (x2, estimacion2);
hold off;
% si no tuvieramos el rand, los valores serian iguales a 3 y 2 (por la ecuacion que tenemos 
% en y -> misma estructura que el ajuste de la curva)
% Al tener el rand tenemos numeros cercanos a estos, aunque no siempre
% iguales
b
a