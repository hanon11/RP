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
        tasa_acierto = length(find(ytst==yestim));
        E1(i) = E1(i)+tasa_acierto;
    end
    E1(i)=E1(i)/KCV;
end
E1=100-E1/length(y)*100;
figure, plot(E1);title('Error estimado CV=10. K vecinos (1 <= K <= 30)')