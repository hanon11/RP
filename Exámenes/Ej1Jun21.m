coefs = calcula_coefs([1 2 3]', [1 2 3]', 4);
x0=4;
yprim = estima(x0, coefs, x);

function coefs = calcula_coefs(x,y,n)
    xp = [x ones(length(x),1)];
    while n+1 >=3
        xp = [(2*xp(:,1)-xp(:,2)) xp];
        n=n-1;
    end
    A = [xp];
    coefs = pinv(A)*y;
end
