clear all;
close all;
clc;
load satimage

KCV=10;
for i=1:30
    E1(i)=0;
    for j=1:KCV
        [xtrn,xtst,ytrn,ytst]=crossval(x,y,KCV,j);
        yestim = zeros(1, length(ytst));
        for k=1:length(ytst)
            d = d_euclid(xtrn, xtst(:, k));
            [~,pos]=sort(d); % me quedo con las k distancias mas cercanas
            yestim(k) = mode(ytrn(pos(1:i))); %la que mas se repite 
        end
        tasa_error = sum(find(ytst~=yestim));
        E1(i) = E1(i)+tasa_error;
    end
    E1(i)=E1(i)/KCV;
end
E1=E1/length(y);
figure, plot(E1);