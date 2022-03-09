clear all;
close all;
clc;

T = readmatrix('winequality-red.csv');
x = T(:, 1:width(T)-1);
y = T(:, width(T)); %calidad de los vinos
A = [x ones(height(x), 1)];
sol = inv(A'*A)*(A'*y)
yEstimada = y-A*sol;
r = sum(abs(yEstimada));
E = r/height(x);
Ecuadrado = (yEstimada'*yEstimada)/height(x);
