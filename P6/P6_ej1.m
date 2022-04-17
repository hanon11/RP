clear all;
close all;
clc;
load iris;

x0 = x(:, find(y==0));
x1 = x(:, find(y==1));
x2 = x(:, find(y==2));
K = 3;
c = x0(:, 1:K);
c0 = kmeans(x0, K, c);
c = x1(:, 1:K);
c1 = kmeans(x1, K, c);
c = x2(:, 1:K);
c2 = kmeans(x2, K, c);

