clear all;
close all;
clc;
rand('seed',0);
x = 2*rand(2, 10000)-1;
ind = find(sum(x.^2)<1);
x = x(:, ind);
% ind = find(x(:,1)<0 OR x(:,2)<0 );
% x = x(:, ind);
K = 2;
c = x(:, 1:K);
for i=1:100
    plotpat(x); hold on;
    plotpat(c, '*'); hold off;
    axis equal;
    pause;
    for j=1:K
        d(j,:) = d_euclid(x, c(:,j)); 
    end

    [~,ganador] = min(d);

    for j=1:K
        ind = find(ganador == j);
        c(:,j)=meanpat(x(:,ind));
    end
end