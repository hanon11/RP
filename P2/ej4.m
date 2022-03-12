clear all;
close all;
clc;
info = audioinfo('a.wav');
[y,Fs] = audioread('a.wav');
x = linspace(-pi,pi,length(y))';
y = y(150:680,2);
x = x(150:680,1);
colores = ['y', 'c','b','m','g'];

for i=1:5
    plot(x,mipolyfitEJ4(x,y,i),colores(i));
    if i==1
        hold on;
    end
end

plot(x,mipolyfitEJ4(x,y,500),'k');
plot(x,y,'r'); 
hold off;
legend('orden 1','orden 2','orden 3','orden 4','orden 5','orden 500','original')

result = mipolyfitEJ4(x,y,500);
final = [result; result; result; result;result; result; result; result];
sound(final,Fs) %aun poniendo un ajuste de 500, suena metalico


