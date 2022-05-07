clear all, clc, close all;
% Genera 100000 datos aleatorios de una distribución gaussiana de media 2 y
% desv.standard 3:
m = 2;
s = 3;
y=m + s*randn(1,100000);

%% apartado b
hist(y);
h = hist(y);

%altura barra central
alt = max(h);
%suma valores
sum_h = sum(h);

%% apartado c
m = mean(y); s = std(y);

%% apartado d
p1 = length(find(m-s < y & y < m+s))/length(y);
p2 = length(find(m-2*s < y & y < m+2*s))/length(y);
p3 = length(find(m-3*s < y & y < m+3*s))/length(y);