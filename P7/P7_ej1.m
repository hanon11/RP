clear all;
close all;
clc;
load satimage

%leave one out + KNN
K=3;
yestim = zeros(1, length(y));
for i=1:length(y)
    [xtrn,xtst,ytrn,ytst]=crossval(x,y,length(y),i);
    d = d_euclid(xtrn, xtst);
    [~,pos]=sort(d); % me quedo con las k distancias mas cercanas
    yestim(i) = mode(ytrn(pos(1:K))); %la que mas se repite 
end 
tasa_acierto_KNN = 100*length(find(y==yestim))/length(y);
C2 = confusionmat(y, yestim);
for i=1:height(C2)
    total = sum(C2(i,:));
    C2(i,:) = C2(i,:)/total
end 