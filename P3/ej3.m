clear all;
close all;
clc;

rng(0);
x = rand(1,100);
y = exp(x.^3 - x.^2 + 0.01*x + 2) + 0.04 * randn(size(x));


for i=1:5
    K=length(x);
    E1(i)=0;
    switch (i)
        case 1
        for j=1:K
           [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
           A = [xtrn' ones(length(xtrn), 1)];
           coefs = pinv(A)*ytrn';
           yest = A*coefs;
    
           A2 = [xtst' ones(length(xtst), 1)];
           yest2 = A2*coefs;
    
           E1(i) = E1(i)+sum((ytst-yest2').^2)/length(yest2);
        end
        E1(i) = E1(i)/K;
        E1(i) = sqrt(E1(i));
        
        case 2
        for j=1:K
           [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
           A = [xtrn' (xtrn.^2)' ones(length(xtrn), 1)];
           coefs = pinv(A)*ytrn';
           yest = A*coefs;
    
           A2 = [xtst' (xtst.^2)' ones(length(xtst), 1)];
           yest2 = A2*coefs;
    
           E1(i) = E1(i)+sum((ytst-yest2').^2)/length(yest2);
        end
        E1(i) = E1(i)/K;
        E1(i) = sqrt(E1(i));

        case 3
        for j=1:K
           [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
           A = [xtrn' (xtrn.^2)' (xtrn.^3)' ones(length(xtrn), 1)];
           coefs = pinv(A)*ytrn';
           yest = A*coefs;
    
           A2 = [xtst' (xtst.^2)' (xtst.^3)' ones(length(xtst), 1)];
           yest2 = A2*coefs;
    
           E1(i) = E1(i)+sum((ytst-yest2').^2)/length(yest2);
        end
        E1(i) = E1(i)/K;
        E1(i) = sqrt(E1(i));

        case 4
        for j=1:K
           [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
           A = [xtrn' (xtrn.^2)' (xtrn.^3)' sin(xtrn)' ones(length(xtrn), 1)];
           coefs = pinv(A)*ytrn';
           yest = A*coefs;
    
           A2 = [xtst' (xtst.^2)' (xtst.^3)' sin(xtst)' ones(length(xtst), 1)];
           yest2 = A2*coefs;
    
           E1(i) = E1(i)+sum((ytst-yest2').^2)/length(yest2);
        end
        E1(i) = E1(i)/K;
        E1(i) = sqrt(E1(i));

        case 5
        for j=1:K
           [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
           A = [xtrn' (xtrn.^2)' (xtrn.^3)' sin(xtrn)' cos(xtrn)' ones(length(xtrn), 1)];
           coefs = pinv(A)*ytrn';
           yest = A*coefs;
    
           A2 = [xtst' (xtst.^2)' (xtst.^3)' sin(xtst)' cos(xtst)' ones(length(xtst), 1)];
           yest2 = A2*coefs;
    
           E1(i) = E1(i)+sum((ytst-yest2').^2)/length(yest2);
        end
        E1(i) = E1(i)/K;
        E1(i) = sqrt(E1(i));
    end
end


figure,  bar(E1); title("Error LOO")

% ============================= RANDOM SAMPLING =========================
Niter = 1000;
for i=1:5
   E2(i)=0;
    switch (i)
        case 1
        for j=1:Niter
            [x,y]=shuffle(x,y);
             A = [x(1:75)' ones(length(x(1:75)), 1)];
             A2 = [x(76:100)' ones(length(x(76:100)), 1)];
             coefs = pinv(A)*y(1:75)';
             yEstimada = A2*coefs;
             E2(i) = E2(i)+sum((y(76:100)-yEstimada').^2)/length(yEstimada);
        end 
           E2(i)=E2(i)/Niter;
           E2(i) = sqrt(E2(i));
        case 2
            for j=1:Niter
                [x,y]=shuffle(x,y);
                 A = [x(1:75)' (x(1:75).^2)' ones(length(x(1:75)), 1)];
                 A2 = [x(76:100)' (x(76:100).^2)' ones(length(x(76:100)), 1)];
                 coefs = pinv(A)*y(1:75)';
                 yEstimada = A2*coefs;
                 E2(i) = E2(i)+sum((y(76:100)-yEstimada').^2)/length(yEstimada);
            end 
           E2(i)=E2(i)/Niter;
           E2(i) = sqrt(E2(i));
        
        case 3
            for j=1:Niter
                [x,y]=shuffle(x,y);
                 A = [x(1:75)' (x(1:75).^2)' (x(1:75).^3)' ones(length(x(1:75)), 1)];
                 A2 = [x(76:100)' (x(76:100).^2)' (x(76:100).^3)' ones(length(x(76:100)), 1)];
                 coefs = pinv(A)*y(1:75)';
                 yEstimada = A2*coefs;
                 E2(i) = E2(i)+sum((y(76:100)-yEstimada').^2)/length(yEstimada);
            end 
           E2(i)=E2(i)/Niter;
           E2(i) = sqrt(E2(i));
        case 4
            for j=1:Niter
                [x,y]=shuffle(x,y);
                 A = [x(1:75)' (x(1:75).^2)' (x(1:75).^3)' sin(x(1:75))' ones(length(x(1:75)), 1)];
                 A2 = [x(76:100)' (x(76:100).^2)' (x(76:100).^3)' sin(x(76:100))' ones(length(x(76:100)), 1)];
                 coefs = pinv(A)*y(1:75)';
                 yEstimada = A2*coefs;
                 E2(i) = E2(i)+sum((y(76:100)-yEstimada').^2)/length(yEstimada);
            end 
           E2(i)=E2(i)/Niter;
           E2(i) = sqrt(E2(i));
        case 5
            for j=1:Niter
                [x,y]=shuffle(x,y);
                 A = [x(1:75)' (x(1:75).^2)' (x(1:75).^3)' sin(x(1:75))'  cos(x(1:75))' ones(length(x(1:75)), 1)];
                 A2 = [x(76:100)' (x(76:100).^2)' (x(76:100).^3)' sin(x(76:100))' cos(x(76:100))' ones(length(x(76:100)), 1)];
                 coefs = pinv(A)*y(1:75)';
                 yEstimada = A2*coefs;
                 E2(i) = E2(i)+sum((y(76:100)-yEstimada').^2)/length(yEstimada);
            end 
           E2(i)=E2(i)/Niter;
           E2(i) = sqrt(E2(i));
    end
end
figure, bar(E2); title("Error Random Sampling")