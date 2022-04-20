clear all;
close all;
clc;
load iris;

x0 = x(:, y==0);
x1 = x(:, y==1);
x2 = x(:, y==2);
K = 3;
c = x0(:, 1:K);
c0 = kmeans(x0, K, c);
c = x1(:, 1:K);
c1 = kmeans(x1, K, c);
c = x2(:, 1:K);
c2 = kmeans(x2, K, c);


centroides = [c0 c1 c2];
valoresCentroides = [zeros(1,3) ones(1,3) [2 2 2]];

for i = 1:length(y)
    distancia = d_euclid(x(:,i),centroides);
    [~,pos] = sort(distancia);
    yest(i) = valoresCentroides(1,pos(1));
end
aciertos = (find(yest == y));
    

