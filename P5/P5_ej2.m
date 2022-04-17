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


K=10;
E1=0;
for j=1:K
    [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
    for k=1:2
        ind = find(ytrn==k);
        media{k} = meanpat(xtrn(:,ind));
    end

    %distancia euclidea
    for k=1:2
        distancia(k,:) = d_euclid(xtst, media{k});
    end
    [~,clase]=min(distancia);
    aciertos_euclidea = sum(ytst == clase);
    aciertos_euclidea = aciertos_euclidea/length(ytst);
    E1 = E1+aciertos_euclidea;
end
E1=E1/K;
E1=100-E1*100;
disp(E1);
