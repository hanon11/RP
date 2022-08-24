clear all,close all, clc
% DATOS
xtrn = linspace(-pi,pi,15)'; % Varios datos de entrenamiento
ytrn = f(xtrn);
xtst = (2*rand(1,20)'-1)*pi; % Varios datos de test
ytst = f(xtst);
% REGRESION MODELO LINEAL
K=8;
coefs = calcula_coefs(xtrn,ytrn,K);
yprim = calcula_valores(coefs,xtst);

function y=f(x)
    y = (0.5+sin(x).^2+sin(3*x) + 0.2*cos(x) + 3*tanh(x))/10;
end

function coefs = calcula_coefs(xtrn, ytrn, K)
    mu = linspace(-pi, pi, K);
    for i=1:K
        gaussiana(:,i)=normpdf(xtrn,mu(i),1);
    end
    A = [gaussiana ones(height(gaussiana),1)];
    coefs = pinv(A)*ytrn;
end

function yprim = calcula_valores(coefs,x)
    K = length(coefs)-1;
    mu = linspace(-pi,pi,K);
    for i=1:K
        gaussiana(:,i) = normpdf(x,mu(i),1);
    end
    A=[gaussiana ones(height(gaussiana),1)];
    yprim = A*coefs;
end