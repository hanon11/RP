close all, clear all, clc

rand('seed',0)
randn('seed',0)

[x,y]=muestra(80);

for i=1:8
    % 1. Error de generalizacion - teórico
    p = polyfit(x,y,i);
    % ---
    [xg,yg]=muestra(2000000);
    yest = polyval(p,xg);
    E1(i) = sum((yg-yest).^2)/length(yest);
    E1(i) = sqrt(E1(i));
    
    % 2. Error de resustitucion
    p = polyfit(x,y,i);
    % ---
    yest = polyval(p,x);
    E2(i) = sum((y-yest).^2)/length(yest);
    E2(i) = sqrt(E2(i));
    
    % 3. Error de validacion simple (50%)
    p = polyfit(x(1:2:end),y(1:2:end),i);
    %---
    yest = polyval(p,x(2:2:end));
    E3(i) = sum((y(2:2:end)-yest).^2)/length(yest);
    E3(i) = sqrt(E3(i));
    
    % 4. Error random sampling
    E4(i)=0;
    Niter = 500;
   for j=1:Niter
     [x,y]=shuffle(x,y);
     p = polyfit(x(1:2:end),y(1:2:end),i);
     %---
     yest = polyval(p,x(2:2:end));
     E4(i) = E4(i)+sum((y(2:2:end)-yest).^2)/length(yest);
   end
   E4(i)=E4(i)/Niter;
   E4(i) = sqrt(E4(i));

   % 5. Error Validacion Cruzada de orden K=5
   K=5;
   E5(i)=0;
   for j=1:K
       [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
       p = polyfit(xtrn,ytrn,i);
       %---
       yest = polyval(p,xtst,i);
       E5(i) = E5(i)+sum((ytst-yest).^2)/length(yest);
   end
   E5(i)=E5(i)/K;
   E5(i) = sqrt(E5(i));

   
   % 6. Leave-one-out = CV de orden K=N
   K=length(y);
   E6(i)=0;
   for j=1:K
       [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
       p = polyfit(xtrn,ytrn,i);
       %---
       yest = polyval(p,xtst,i);
       E6(i) = E6(i)+sum((ytst-yest).^2)/length(yest);
   end
   E6(i)=E6(i)/K;
   E6(i) = sqrt(E6(i));
   
end

figure,plot(E1),title('Error de generalizacion (teorico)')
figure,plot(E2),title('Error de resustitucion')
figure,plot(E3),title('Error de validacion simple al 50%')
figure,plot(E4),title('Error random sampling (valid.50%)')
figure,plot(E5),title('Error CV(K=5)')
figure,plot(E6),title('Error LOO')