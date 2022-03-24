x1 = 15+2*randn(1,1000);
x2 = 23+4*randn(1,1000);
x = [x1 x2];
y = [zeros(1,1000) ones(1,1000)]; 

subplot(3,1,1),bar(x);
[x,y] = shuffle(x,y);
subplot(3,1,2),bar(x);
subplot(3,1,3),bar(sort(x));
