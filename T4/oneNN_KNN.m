clear all;
close all;
clc;
load iris

%leave one out + 1NN
yestim = zeros(1, length(y));
for i=1:length(y)
    [xtrn,xtst,ytrn,ytst]=crossval(x,y,length(y),i);
    %xtst es el que quiero clasificar
    d = d_euclid(xtrn, xtst);
    [~, pos] = min(d); %de todos los datos de entrenamiento, cojo el que esta mas cerca de los datos de test
    yestim(i) = ytrn(pos);  
end

tasa_acierto_1NN = 100*length(find(y==yestim))/length(y)
C1 = confusionmat(y, yestim)
%           clase estimada
%clase real 0   1 2
%          0 50 0 0  -> de la clase 0 he estimado bien los 50 datos
%          1
%          2


%leave one out + KNN
K=20;
yestim = zeros(1, length(y));
for i=1:length(y)
    [xtrn,xtst,ytrn,ytst]=crossval(x,y,length(y),i);
    d = d_euclid(xtrn, xtst);
    [~,pos]=sort(d); % me quedo con las k distancias mas cercanas
    yestim(i) = mode(ytrn(pos(1:K))); %la que mas se repite 
end 

tasa_acierto_KNN = 100*length(find(y==yestim))/length(y)
C2 = confusionmat(y, yestim)