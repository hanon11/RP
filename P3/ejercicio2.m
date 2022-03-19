clear all;
close all;
clc;

rand('seed', 0);
randn('seed', 0);
x = rand(1,1000000);
y = exp(x.^3 - x.^2 + 0.01*x + 2) + 0.04 * randn(size(x));
errores_medios = zeros(5,1);
% 1. Un polinomio de orden 1: y = a + b*x
for i=1:5
    E1(i)=0;
    switch (i)
        case 1
           A = [x' ones(length(x), 1)];
           coefs = pinv(A)*y';
           yest = A*coefs;
           r = sum(abs(yest));
           errores_medios(1) = r/height(x);
            
        case 2
           A = [x' (x.^2)' ones(length(x), 1)];
           coefs = pinv(A)*y';
           yest = A*coefs;
           r = sum(abs(yest));
           errores_medios(2) = r/height(x);

        case 3
           A = [x' (x.^2)' (x.^3)' ones(length(x), 1)];
           coefs = pinv(A)*y';
           yest = A*coefs;
           r = sum(abs(yest));
           errores_medios(3) = r/height(x);

        case 4
           A = [x' (x.^2)' (x.^3)' sin(x)' ones(length(x), 1)];
           coefs = pinv(A)*y';
           yest = A*coefs;
           r = sum(abs(yest));
           errores_medios(4) = r/height(x);

        case 5
           A = [x' (x.^2)' (x.^3)' sin(x)' cos(x)' ones(length(x), 1)];
           coefs = pinv(A)*y';
           yest = A*coefs;
           r = sum(abs(yest));
           errores_medios(5) = r/height(x);
    end
end
errores_medios = errores_medios/1000000;
figure,plot(errores_medios), title('CV=10');
