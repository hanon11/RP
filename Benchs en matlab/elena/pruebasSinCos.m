clear all
close all
clc
t = 0:0.01:2*pi;

x = sin(t);
x2 = cos(t);
x3 = 0.8*x + 0.6*x2; 
% si ambos terminos al cuadrado dan como resultado 1 => misma amplitud que el seno y el coseno

plot(t, x); hold on; plot(t, x2); plot(t, x3); hold off;
