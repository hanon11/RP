load iris
errores = 0;
for i=1:length(x)
    [xtrn, xtst, ytrn, ytst]=crossval(x,y,length(x),i);
    clase = clasifica_Parzen(xtrn,ytrn,xtst);
    if clase ~= ytst
        errores = errores+1;
    end
end
errores = errores/length(x);
errores=errores*100;

function clase = clasifica_Parzen(x, y, xi)
    for i=1:3
        xtrn = x(:,find(i==y));
        d(i)=0;
        for j=1:length(xtrn)
            mu = xtrn(:,j);
            C = eye(4);
            d(i)=d(i)+mvnpdf(xi',mu,C);
        end
        d(i)=d(i)/length(xtrn);
        %probabilidad a priori
        Pw(i)=length(xtrn)/length(x);
        P(i)=Pw(i)*d(i);
    end
    [~,clase]=max(P);
end

