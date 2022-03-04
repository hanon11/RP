clear all;
close all;
clc;
x = [-1 : 0.1 : 1]';
y = [5*x.^3 - x.^2 + 2*x + 1];
A = [x ones(size(x))];
sol = inv(A'*A)*(A'*y);
figure,hold on; plot (x,y,'o'); plot (x,A*sol,'r'),title('Ajuste 1');hold off; 

A = [x x.^2 ones(size(x))];
sol = inv(A'*A)*(A'*y);
figure,hold on; plot (x,y,'o'); plot (x,A*sol,'r'),title('Ajuste 2');hold off; 


A = [x x.^2  x.^3 ones(size(x))];
sol = inv(A'*A)*(A'*y);
figure,hold on; plot (x,y,'o'); plot (x,A*sol,'r'),title('Ajuste 3');hold off; 