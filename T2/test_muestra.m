% solo tenemos los datos de la muestra, por lo que debemos generar la curva
% lo mas cercana al error
% cuanto mas pequeña sea la muestra, los problemas son mayores
close all;
clear all;
%para tener numeros aleatorios pero que sean los mismos y que
%siempre nos dé los mismos resultados en la grafica
rand('seed',0); randn('seed',0); 
%[x,y] = muestra(100); plot(x,y,'*');
%[x,y] = muestra(1000); plot(x,y,'*');
%[x,y] = muestra(10000); plot(x,y,'*');
[x,y] = muestra(20);

for i=1:8
    p = polyfit(x,y,i);

    %1. Error de resustitucion
    ytest = polyval(p,x);
    E1(i) = sum((y-ytest).^2);

    %2. Error de generalizacion -> suponiendo que tengo los datos de toda
    %la población para ver qué tal se comporta el sistema
    [xg,yg] = muestra(2000000);
    ytest = polyval(p,xg);
    E2(i) = sum((yg-ytest).^2);

    %3. Error de validacion simple -> suponiendo que tengo los datos de toda
    %la población para ver qué tal se comporta el sistema
    p = polyfit(x(1:15),y(1:15),i);
    ytest = polyval(p,x(16:20));
    E3(i) = sum((y(16:20)-ytest).^2);


%     xi=-2:0.01:2;
%     yi=polyval(p,xi);
% 
%     plot(x,y,'ob'); hold on;
%     plot(xi, yi,'r'); hold off;
%     title(['Orden= ' num2str(i) ' Error= ' num2str(E1(i))]);
%     pause
end
figure,plot(E1), title('Error de resustitucion');
figure,plot(E2), title('Error de generalizacion (teorico)');
figure,plot(E3), title('Error de validacion simple al 75%');

% cuidao con los modelos complejos
% muestras cuanto mas grandes mejor
% queremos que el sistema funcione bien para datos que aun no ha visto




%CODIGO DE PEDRO
% close all, clear all, clc
% 
% rand('seed',0)
% randn('seed',0)
% 
% [x,y]=muestra(20);
% 
% xi=-2:0.01:2;
% 
% for i=1:8
%     
%     % 1. Error de resustitucion
%     p = polyfit(x,y,i);
%     % ---
%     yest = polyval(p,x);
%     E1(i) = sum((y-yest).^2);
%     
%     % 2. Error de generalizacion
%     p = polyfit(x,y,i);
%     % ---
%     [xg,yg]=muestra(2000000);
%     yest = polyval(p,xg);
%     E2(i) = sum((yg-yest).^2);
% 
%     % 3. Error de validacion simple (50%)
%     p = polyfit(x(1:2:end),y(1:2:end),i);
%     %---
%     yest = polyval(p,x(2:2:end));
%     E3(i) = sum((y(2:2:end)-yest).^2);
%     
%     % 4. Error random sampling
%     E4(i)=0;
%    for j=1:5000
%      [x,y]=shuffle(x,y);
%      p = polyfit(x(1:18),y(1:18),i);
%      %---
%      yest = polyval(p,x(19:end));
%      E4(i) = E4(i)+sum((y(19:end)-yest).^2);
%    end
%    E4(i)=E4(i)/500;
% 
%    % 5. Error Validacion Cruzada de orden K=5
%    K=5;
%    E5(i)=0;
%    for j=1:K
%        [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,j);
%        p = polyfit(xtrn,ytrn,i);
%        %---
%        yest = polyval(p,xtst,i);
%        E5(i) = E5(i)+sum((ytst-yest).^2);
%    end
%    E5(i)=E5(i)/K;
%     
%     
% %     xi=-2:0.01:2;
% %     yi=polyval(p,xi);
% %     
% %      plot(x,y,'ob');hold on;
% %      plot(xi,yi,'r');hold off
% %      title(['Orden=' num2str(i) ' Error=' num2str(E1(i))])
% %      pause
% end
% 
% figure,plot(E1),title('Error de resustitucion')
% figure,plot(E2),title('Error de generalizacion (teorico)')
% figure,plot(E3),title('Error de validacion simple al 50%')
% figure,plot(E4),title('Error random sampling')
% figure,plot(E5),title('Error CV(K=5)')
