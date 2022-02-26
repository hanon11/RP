%lo mismo que el anterior pero sin polyfit

clear all
close all
clc

x = [-1:0.25:1]';

y = [-3 -1 2 4 2 -1 -4 0 3]';

A = [x.^3 x.^2 x ones(size(x))];

coefs = pinv(A)*y;

salida=A*coefs;

plot(y);
hold on;
plot(salida);
plot(y-salida);
hold off;
legend('salida real','salida estimada','error');