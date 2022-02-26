clear all
close all
clc

load iris

A = [ x(1:3,:)' ones(150,1) ];
b = x(4,:)';

coefs = pinv(A)*b;
salida = A*coefs;

plot(b); hold on; plot(salida); plot(b-salida); hold off;
legend('salida real', 'salida estimada', 'error');