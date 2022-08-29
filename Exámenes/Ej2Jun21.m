load iris
K=length(y);
Error=0;

[W,~]=fisher(x,y,3);
xp=W*x;
x=xp;

for i=1:K
    [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,i);
    d = zeros(length(unique(ytrn)),height(xtrn));
    for j=1:length(unique(ytrn))
        datos=xtrn(:,find(j==ytrn));
        for k=1:length(datos)
            d(j,:)=d(j,:)+normpdf(xtst',datos(k),1);
        end
        d(j,:)=d(j,:)/length(datos);
        Pw(j)=length(datos)/length(ytrn); %probabilidad a priori
        P(j)=Pw(j)*d(j); % probabilidad a posteriori
    end
    [~,clase]=max(P);
    if clase ~= ytst
        Error = Error+1;
    end
end
Error=Error/K*100

