load iris
N = 3;
M = calcula_centros(x, y, N);
salida_estimada = clasifica([6.10000000000000;
2.90000000000000;
4.70000000000000;
1.40000000000000], M);


function centroides = k_means(x,k)
    centroides = x(:,1:k);
    for i=1:100
        for j=1:k
            d(j,:)=d_euclid(x, centroides(:,j));
        end
        [~,ganador]=min(d);
        for j=1:k
            ind = find(ganador==j);
            centroides(:,j)=meanpat(x(:,ind));
        end
    end
end

function centroides = calcula_centros(x,y,N)
    y=y+1;
    for i=1:length(unique(y))
        xp{i}=x(:, y==i);
        c{i}=k_means(xp{i},N);
    end
    centroides = [c{1} c{2} c{3}];
    centroides = [centroides; 1 1 1 2 2 2 3 3 3];
end

function salida = clasifica(x0, centroides)
    distancia = d_euclid(x0,centroides(1:height(centroides)-1,:));
    [~,pos] = sort(distancia);
    salida = centroides(height(centroides),pos(1))-1;
end