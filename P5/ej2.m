clear all;
close all;
clc;

rand('seed', 0);
randn('seed', 0);
x1 = randnorm([0,0], [1 0.8; 0.8 2], 1000);
x2 = randnorm([3,3], [1 -0.9;0.9 2], 1000);
x = [x1 x2];
y = [zeros(1,1000) ones(1,1000)]; 
[x,y] = shuffle(x,y);

