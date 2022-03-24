clear all;
close all;
clc;

rng(0);
x = rand(1,100000);
y = exp(x.^3 - x.^2 + 0.01*x + 2) + 0.04 * randn(size(x));

% 1. Un polinomio de orden 1: y = a + b*x
for i=1:5
    switch (i)
        case 1
           A = [x' ones(length(x), 1)];
           coefs = pinv(A)*y';
           yEstimada = y'-A*coefs;
           r = sum(abs(yEstimada));
           E_medio(i) = r/length(x);
        
        case 2
           A = [x' (x.^2)' ones(length(x), 1)];
           coefs = pinv(A)*y';
           yEstimada = y'-A*coefs;
           r = sum(abs(yEstimada));
           E_medio(i) = r/length(x);

        case 3
            A = [x' (x.^2)' (x.^3)' ones(length(x), 1)];
           coefs = pinv(A)*y';
           yEstimada = y'-A*coefs;
           r = sum(abs(yEstimada));
           E_medio(i) = r/length(x);

        case 4
           A = [x' (x.^2)' (x.^3)' sin(x)' ones(length(x), 1)];
           coefs = pinv(A)*y';
           yEstimada = y'-A*coefs;
           r = sum(abs(yEstimada));
           E_medio(i) = r/length(x);

        case 5
            A = [x' (x.^2)' (x.^3)' sin(x)' cos(x)' ones(length(x), 1)];
           coefs = pinv(A)*y';
           yEstimada = y'-A*coefs;
           r = sum(abs(yEstimada));
           E_medio(i) = r/length(x);
    end
end

bar(E_medio);title("Error cometido")