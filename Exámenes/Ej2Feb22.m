dfocal = [8 20 35 50 85 200]';
angulo = [180 94 63 46 28.5 12]';


[a,b]=calcula_coefs(dfocal, angulo);


xi=8:1:200;
plot(xi, exp(a)*xi.^b); hold on;
plot(dfocal, angulo, 'o'); 

x0 = 100;
y0 = estima(x0, a, b);
plot(x0, y0, 'r*');
hold off;

function [a, b] = calcula_coefs(dfocal, angulo)
    A = [log(dfocal) ones(length(dfocal),1)];
    coefs = pinv(A)*log(angulo);
    a=coefs(2); b=coefs(1);
end

function anguloEstimado = estima(dfocal_trn, a, b)
    anguloEstimado = exp(a)*dfocal_trn.^b;
end