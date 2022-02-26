clear all
close all
clc

%ejemplo de resolución de sistema de orden 3 con polyfit

x = [-1:0.25:1];

y = [-3 -1 2 4 2 -1 -4 0 3];


plot(x,y,'o'); hold on;
p = polyfit(x,y,3);

xi=-1:0.1:1;
plot(xi,polyval(p,xi)); hold off;