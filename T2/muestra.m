function [x,y] = muestra(N)
    p = [-1.3750 -0.2500 4.8750 0.7500 -1.0000];
   
    x = 4*rand(1,N)-2;
    y = polyval(p,x)+randn(1,N);
end

%para tener numeros aleatorios pero que sean los mismos y que
%siempre nos dé los mismos resultados en la grafica
%rand('seed',0); randn('seed',0); 
%[x,y] = muestra(100); plot(x,y,'*');
%[x,y] = muestra(1000); plot(x,y,'*');
%[x,y] = muestra(10000); plot(x,y,'*');