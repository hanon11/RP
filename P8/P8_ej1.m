clear all;
close all;
clc;
rng(0);

x=randnorm([3 4], [1 0.8 ; 0.8 1], 1000);
x = x - [3 ; 4]; % restamos la media

[W, lambda] = pca(x);
x1=W*x;
figure, plot(x(1,:), x(2,:),'*r'); hold on;
plot(x1(1,:), x1(2,:),'*b'); hold off;legend('Datos iniciales', 'x prima');


x2=pinv(W)*x1;
figure, plot(x(1,:), x(2,:),'*g'); hold on;
plot(x2(1,:), x2(2,:),'.b'); hold off; legend('Datos iniciales', 'Datos reconstruidos');


distancias=0;
for i=1:1:length(x)
    distancias = distancias + d_euclid(x(:, i),x2(:, i));
end

%si modifico W
Waux = W - 0.3;
x1=Waux*x;
x2=pinv(Waux)*x1;
distanciasModificada=0;
for i=1:1:length(x)
    distanciasModificada = distanciasModificada + d_euclid(x(:, i),x2(:, i));
end
%si modifico W
Waux = W + 0.3;
x1=Waux*x;
x2=pinv(Waux)*x1;
distanciasModificada2=0;
for i=1:1:length(x)
    distanciasModificada2 = distanciasModificada2 + d_euclid(x(:, i),x2(:, i));
end

% tanto si aumento como si disminuyo W, la suma de las distancias es mayor.
% W es siempre la transformación óptima.

[W, lambda] = pca(x,1);
x1=W*x;
figure, plot(x(1,:), x(2,:),'*r'); hold on;
plot(x1,'*b'); hold off;legend('Datos iniciales', 'x prima dim 1');


x2=pinv(W)*x1;
figure, plot(x(1,:), x(2,:),'*g'); hold on;
plot(x2(1,:), x2(2,:),'.b'); hold off; legend('Datos iniciales', 'Datos reconstruidos');
