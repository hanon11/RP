clear all;
close all;
clc;
rng(0);

x_= randnorm([3 4], [1 0.8 ; 0.8 1], 1000);
x__= randnorm([5 0], [1 0.8 ; 0.8 1], 1000);

x=[x_ x__];
x = x-meanpat(x);
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

%%
% quedandome solo con los datos del eje x, claramente podemos ver que
% existe mas diferenciacion usando fisher que usando pca