clear all;
close all;
clc;
load iris;

KCV=length(y);
for i=1:1:10
    Aciertos(i) = 0;
    for j=1:1:KCV
        [xtrn,xtst,ytrn,ytst]=crossval(x,y,KCV,j);
        x0 = xtrn(:, ytrn==0);
        x1 = xtrn(:, ytrn==1);
        x2 = xtrn(:, ytrn==2);
        c = x0(:, 1:i);
        c0 = kmeans(x0, i, c);
        c = x1(:, 1:i);
        c1 = kmeans(x1, i, c);
        c = x2(:, 1:i);
        c2 = kmeans(x2, i, c);
    
        centroides = [c0 c1 c2];
        valoresCentroides = [zeros(1,width(c0)) ones(1,width(c1)) (ones(1,width(c2))+1)];
        
        for k = 1:length(ytst)
            distancia = d_euclid(xtst(:,k),centroides);
            [~,pos] = sort(distancia);
            yest(k) = valoresCentroides(1,pos(1));
        end
        aciertos = length(find(yest == ytst))/length(ytst);
        Aciertos(i) = Aciertos(i)+aciertos;
    end
    Aciertos(i)=100-(Aciertos(i)/KCV)*100;
    
end
plot(Aciertos);