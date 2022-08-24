clear
close all
clc
[x,y]=genera(550,450,0,2,2,2);
d=calcula_densidades(x,y);
x0=-5.97; clase = clasifica(d,x0,550,450);
plot(x,y,'o');

function [x,y]=genera(N1,N2,m1,m2,s1,s2)
    x1=s1*randnorm(0,1,N1)+m1;
    x2=s2*randnorm(0,1,N2)+m2;
    x=[x1 x2];
    y=[zeros(1,length(x1)) ones(1,length(x2))]+1;
    [x,y]=shuffle(x,y);
end


function d = calcula_densidades(x,y)
    xi=-10:0.01:10;
    d = zeros(2, length(xi));
    for i=1:2
        xaux=x(:,find(y==i)); 
        for j=1:length(xaux)
            d(i,:)=d(i,:)+normpdf(xi,xaux(i),0.5);
        end
    end
end


function clase = clasifica(d,x0,N1,N2)
    Pw=[N1 N2]/(N1+N2);
    P(1,:)=Pw(1)*d(1,:);
    P(2,:)=Pw(2)*d(2,:);
    xi=-10:0.01:10;
    pos=find(xi==x0);
    [~,clase]=max(P(:,pos));
end