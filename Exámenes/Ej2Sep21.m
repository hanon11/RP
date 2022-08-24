clear
close all
clc
x = 5*rand(1,20); % Genero algunos datos con x aleatoria
y = 1.5*x.^2.2; 

plot(x,y,'*');hold on;
[A,M]=calcula(x,y);
yprim = estima(A, M, x);
plot(x,yprim,'ro');
hold off;

%y=A*x^M

function [A, M] = calcula(x,y)
    yp=log(y);
    xp=log(x);
    
    Matriz = [xp' ones(length(xp),1)];
    coefs=pinv(Matriz)*yp';
    
    M=coefs(1); A=coefs(2);
end

function yprim=estima(A,M,x)
    yprim=exp(A)*x.^M;
end
