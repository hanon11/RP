clear all
close all
clc

x = [6.1543 7.9194 9.2181 7.3821 1.7627 4.0571 9.3547 9.1690 4.1027 8.9365]';
y = [21.0518 23.0857 31.0830 27.3933 5.9044 15.8872 32.5721 26.3197 11.4262 29.9518]';

% Realizar y dibujar el ajuste de una recta
% primera version
p = polyfit(x,y,1);
xp = linspace(0,10);
plot (xp,polyval(p,xp)); hold on;
% segunda version
A = [x ones(size(x))];
coefs = pinv(A)*y;
r = y-A*coefs;
E = r'*r;
xr=[0 10];
yr=[coefs(2) coefs(1)*10+coefs(2)];
plot (xr,yr); 



%Añadir el dato x = 15, y = 2, y volver a realizar el ajuste. 
x(end+1) = 15;
y(end+1) = 2;

p = polyfit(x,y,1);
xp = linspace(0,10);
plot (xp,polyval(p,xp));

A = [x ones(size(x))];
coefs = pinv(A)*y;
r = y-A*coefs;
E = r'*r;
xr=[0 10];
yr=[coefs(2) coefs(1)*10+coefs(2)];
plot (xr,yr); hold off;
legend("v1 a", 'v2 a', 'v1 b', 'v2 b');
% al añadir el nuevo dato, la recta se hace mucho mas paralela al eje x, ya
% que el valor de x es bastante mas alto de los que ya tenemos y la y es
% bastante pequeña. Luego la nueva recta debe adaptarse a esto

