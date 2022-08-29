load iris
L=[0 1 1; 1 0 1; 2 2 0];

y=y+1;

K=length(y);
Error=0;

[W,~]=fisher(x,y,3);
xp=W*x;
x=xp;

for i=1:K
    d = zeros(length(unique(ytrn)),height(xtrn));
    [xtrn,xtst,ytrn,ytst]=crossval(x,y,K,i);
    for j=1:3
      indices=find(ytrn==j);
      m{j}=mean(xtrn(indices));
      s{j}=std(xtrn(indices));
      Pw(j)=length(indices)/length(ytrn);
    end
    for j=1:3
      d(j,:) = sum(L(j,:))*Pw(j)*normpdf(xtst',m{j},s{j});
    end
        
    [~,clase]=max(d);
    if clase ~= ytst
        Error = Error+1;
    end
end
Error=Error/K*100

