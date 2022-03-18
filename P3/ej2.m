clear all;
close all;
clc;

rand('seed', 0);
randn('seed', 0);
x = rand(1,100);
y = exp(x.^3 - x.^2 + 0.01*x + 2) + 0.04 * randn(size(x));
x2 = rand(1,1000000);
y2 = exp(x2.^3 - x2.^2 + 0.01*x2 + 2) + 0.04 * randn(size(x2));
% 1. Un polinomio de orden 1: y = a + b*x
for i=1:5
    K=10;
    E1(i)=0;
    E2(i)=0;
    switch (i)
        case 1
        for j=1:K
           [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
           A = [xtrn' ones(length(xtrn), 1)];
           sol = pinv(A)*ytrn';
           yest = A*sol;
    
           A2 = [xtst' ones(length(xtst), 1)];
           yest2 = A2*sol;

           AError = [x2' ones(length(x2), 1)];
           ytestError = AError*sol;
           error = y2' - ytestError;
           r = sum(abs(error));
           E2(i) = E2(i) + r/length(x2);
           E1(i) = E1(i)+sum((ytst-yest2').^2)/length(yest2);
        end
        E1(i) = E1(i)/K;
        E2(i) = E2(i)/K;
        E1(i) = sqrt(E1(i));

        
        case 2
        for j=1:K
           [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
           A = [xtrn' (xtrn.^2)' ones(length(xtrn), 1)];
           sol = pinv(A)*ytrn';
           yest = A*sol;
    
           A2 = [xtst' (xtst.^2)' ones(length(xtst), 1)];
           yest2 = A2*sol;
    
           AError = [x2' x2.^2' ones(length(x2), 1)];
           ytestError = AError*sol;
           error = y2' - ytestError;
           r = sum(abs(error));
           E2(i) = E2(i) + r/length(x2);
           E1(i) = E1(i)+sum((ytst-yest2').^2)/length(yest2);
        end
        E1(i) = E1(i)/K;
        E2(i) = E2(i)/K;
        E1(i) = sqrt(E1(i));

        case 3
        for j=1:K
           [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
           A = [xtrn' (xtrn.^2)' (xtrn.^3)' ones(length(xtrn), 1)];
           sol = pinv(A)*ytrn';
           yest = A*sol;
    
           A2 = [xtst' (xtst.^2)' (xtst.^3)' ones(length(xtst), 1)];
           yest2 = A2*sol;
    
           AError = [x2' x2.^2' x2.^3' ones(length(x2), 1)];
           ytestError = AError*sol;
           error = y2' - ytestError;
           r = sum(abs(error));
           E2(i) = E2(i) + r/length(x2);
           E1(i) = E1(i)+sum((ytst-yest2').^2)/length(yest2);
        end
        E1(i) = E1(i)/K;
        E2(i) = E2(i)/K;
        E1(i) = sqrt(E1(i));

        case 4
        for j=1:K
           [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
           A = [xtrn' (xtrn.^2)' (xtrn.^3)' sin(xtrn)' ones(length(xtrn), 1)];
           sol = pinv(A)*ytrn';
           yest = A*sol;
    
           A2 = [xtst' (xtst.^2)' (xtst.^3)' sin(xtst)' ones(length(xtst), 1)];
           yest2 = A2*sol;

           AError = [x2' x2.^2' x2.^3' sin(x2)' ones(length(x2), 1)];
           ytestError = AError*sol;
           error = y2' - ytestError;
           r = sum(abs(error));
           E2(i) = E2(i) + r/length(x2);
           E1(i) = E1(i)+sum((ytst-yest2').^2)/length(yest2);
        end
        E1(i) = E1(i)/K;
        E2(i) = E2(i)/K;
        E1(i) = sqrt(E1(i));

        case 5
        for j=1:K
           [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
           A = [xtrn' (xtrn.^2)' (xtrn.^3)' sin(xtrn)' cos(xtrn)' ones(length(xtrn), 1)];
           sol = pinv(A)*ytrn';
           yest = A*sol;
    
           A2 = [xtst' (xtst.^2)' (xtst.^3)' sin(xtst)' cos(xtst)' ones(length(xtst), 1)];
           yest2 = A2*sol;
    
           AError = [x2' x2.^2' x2.^3' sin(x2)' cos(x2)' ones(length(x2), 1)];
           ytestError = AError*sol;
           error = y2' - ytestError;
           r = sum(abs(error));
           E2(i) = E2(i) + r/length(x2);
           E1(i) = E1(i)+sum((ytst-yest2').^2)/length(yest2);
        end
        E1(i) = E1(i)/K;
        E2(i) = E2(i)/K;
        E1(i) = sqrt(E1(i));
    end
end

plot(E1,'r'); hold on; plot(E2,'b');