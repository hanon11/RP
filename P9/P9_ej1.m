clear all, clc, close all;
%% apartado a
rand("seed",0);
X = fix(rand(1,30)*100);
%% b) ¿Cuántos valores hay en los intervalos [0<9], [10<19], [20<29] … [90<99]? 
i = 1;
for j=0:10:90
    num_valores(i) = length(find(X >= j & X < j+10));
    i = i+1;
end
    % [7,0,2,2,2,4,5,3,2,3]

%% apartado c
hist(X); 
[a,b]=hist(X);
a=hist(X,5:10:95);
[a,b]=hist(X,5:10:95);

%% apartado d 
% primera -> el numero de elementos desde -infinito hasta 
% ultima -> el numero de elementos desde ----- hasta infinito

%% apartado e
total = sum(a); % = 30

%% apartado f
prob = a/total;

%% apartado g
totalProb = sum(prob); % = 1

%% apartado h
X = fix(rand(1,1000)*100);
hist(X);
% si el numero de barras del histograma es muy bajo, no seremos capaces de
% distinguir aquellos intervalos que destaquen del resto, ya que a menos
% barras -> mayor intervalo tienen -> mas puntos se concentran. Cuando
% escogemos un numero muy pequeño, nuevamente no seremos capces de ver los
% intervalos que destaquen


%% apartado i
X = fix(rand(1,100000)*100);
nBins = 1 + 3.222 * log(100000); %https://www.lifeder.com/regla-sturges/
hist(X, nBins);
