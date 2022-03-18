clear all;
close all;
clc;
x = [-1 : 0.1 : 1]';
y = [5*x.^3 - x.^2 + 2*x + 1];
A = [x ones(size(x))];
coefs = pinv(A)*y;
figure,hold on; plot (x,y,'o'); plot(x,A*coefs,'r'),title('Ajuste 1');
plot(x,A*mipolyfit(x,y,1),'*b'); % pinto mi polyfit con asteriscos para verlo mejor, las graficas se superponen (como debe ser)
legend("Puntos", "Primer ajuste", "mipolyfit");
hold off; 

A = [x x.^2 ones(size(x))];
coefs = pinv(A)*y;
figure,hold on; plot (x,y,'o'); plot (x,A*coefs,'r'),title('Ajuste 2');
plot(x,A*mipolyfit(x,y,2),'*b');
legend("Puntos", "Primer ajuste", "mipolyfit");
hold off; 


A = [x x.^2  x.^3 ones(size(x))];
coefs = pinv(A)*y;
figure,hold on; plot (x,y,'o'); plot (x,A*coefs,'r'),title('Ajuste 3');
plot(x,A*mipolyfit(x,y,3),'*b');
legend("Puntos", "Primer ajuste", "mipolyfit");
hold off; 


