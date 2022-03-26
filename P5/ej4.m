clear all;
close all;
clc;
rand('seed', 0);
randn('seed', 0);

x1 = randnorm([0,0], [1 0.8; 0.8 2], 1000);
x2 = randnorm([3,3], [1 -0.9;-0.9 2], 1000);
x = [x1 x2];
y = [zeros(1,1000) ones(1,1000)];
[x,y] = shuffle(x,y);
y = y+1; %x1 = 1 y x2 =2


for k=1:2
    ind = find(y==k);
    media{k} = meanpat(x(:,ind));
    covarianza{k} = covpat(x(:,ind));
end

%distancia euclidea
for k=1:2
    distanciaEuclidea(k,:) = d_euclid(x, media{k});
end
[~,claseEuclidea]=min(distanciaEuclidea);
aciertos_euclidea = sum(y == claseEuclidea);
aciertos_euclidea = aciertos_euclidea/length(y);

%Mahalanobis
for k=1:2
    distanciaMahalanobis(k,:) = d_mahal(media{k}, x, covarianza{k});
end
[~,claseMahalanobis]=min(distanciaMahalanobis);

plot(x1(1,:),x1(2,:),'.');
hold on;
plot(x2(1,:),x2(2,:),'r.');
plotbon(media{1},[1 0;0 1],media{2},[1 0;0 1],'g');
plotbon(media{1},covarianza{1},media{2},covarianza{2},'r');
hold off;
legend('Puntos de clase 1', 'Puntos clase 2', 'Frontera Euclidea', 'Frontera Mahalanobis');


    

