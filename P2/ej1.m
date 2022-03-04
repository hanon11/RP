clear all;
close all;
clc;

T = readtable('winequality-red.csv');
T = T{:,:};
x = T(:, 1:width(T)-1);
y = T(:, width(T)); %calidad de los vinos
A = [x ones(height(x), 1)];
sol = inv(A'*A)*(A'*y)

r = y-A*sol;
E = r'*r
