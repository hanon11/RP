clear all;
close all;
clc;

T = readmatrix('winequality-red.csv');
x = T(:, 1:width(T)-1);
y = T(:, width(T)); %calidad de los vinos
A = [x ones(height(x), 1)];
coefs = pinv(A)*y;
yEstimada = y-A*coefs;
r = sum(abs(yEstimada));
E_medio = r/height(x);
E_medio_cuadrado = (yEstimada'*yEstimada)/height(x);
