clear all;
close all;
clc;
rng(0);

x_= randnorm([3 4], [1 0.8 ; 0.8 1], 1000);
%x_ = x_ - [3 ; 4]; % restamos la media
x__= randnorm([5 0], [1 0.8 ; 0.8 1], 1000);
%x__ = x__ - [5 ; 0]; % restamos la media

x=[x_ x__];
y=[ones(1,1000),(ones(1,1000)+1)];

[W, ~] = pca(x);
x1=W*x;
figure, plot(x(1,:), x(2,:),'*r'); hold on;
plot(x1(1,:), x1(2,:),'.b'); 
hold off; legend('Datos iniciales', 'Datos transformados PCA');

[W, f, e] = fisher(x, y,2);
x1=W*x;
figure, plot(x(1,:), x(2,:),'*r'); hold on;
plot(x1(1,:), x1(2,:),'.b'); 
hold off; legend('Datos iniciales', 'Datos transformados LDA');