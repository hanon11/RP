clear all, clc, close all;
randn("seed",0);
N=5000;
%% apartado a
pw1=0.5; 
m1=20;
s1=3;


pw2=0.5; 
m2=25;
s2=2;

x = [(m1+s1*randn(1,pw1*N)) (m2+s2*randn(1,pw2*N))];
y = [zeros(1,pw1*N) ones(1,pw2*N)];


%% apartado b
indices1=find(y==0);  indices2=find(y==1);
m1=mean(x(indices1)); m2=mean(x(indices2));
s1=std(x(indices1));  s2=std(x(indices2));
Pw1=length(indices1)/length(y);
Pw2=length(indices2)/length(y);

A=s1*s1-s2*s2;
B=2*(m1*s2*s2-m2*s1*s1);
C=2*s1*s1*s2*s2*(log(Pw1)-log(Pw2)-log(s1)+log(s2))+s1*s1*m2*m2-s2*s2*m1*m1;

%fronteras
x1=(-B+sqrt(B*B-4*A*C))/2/A; disp(x1);
x2=(-B-sqrt(B*B-4*A*C))/2/A; disp(x2);
figure;
I=5:0.01:40;plot(I,Pw1*normpdf(I,m1,s1));hold on;
plot(I,Pw2*normpdf(I,m2,s2),'r');hold off;

%% apartado c
pw1=0.7; 
m1=20;
s1=3;

pw2=0.3; 
m2=25;
s2=2;

x = [(m1+s1*randn(1,pw1*N)) (m2+s2*randn(1,pw2*N))];
y = [zeros(1,pw1*N) ones(1,pw2*N)];

indices1=find(y==0);  indices2=find(y==1);
m1=mean(x(indices1)); m2=mean(x(indices2));
s1=std(x(indices1));  s2=std(x(indices2));
Pw1=length(indices1)/length(y);
Pw2=length(indices2)/length(y);

A=s1*s1-s2*s2;
B=2*(m1*s2*s2-m2*s1*s1);
C=2*s1*s1*s2*s2*(log(Pw1)-log(Pw2)-log(s1)+log(s2))+s1*s1*m2*m2-s2*s2*m1*m1;

%fronteras
x1=(-B+sqrt(B*B-4*A*C))/2/A; disp(x1);
x2=(-B-sqrt(B*B-4*A*C))/2/A; disp(x2);
figure;
I=5:0.01:40;plot(I,Pw1*normpdf(I,m1,s1));hold on;
plot(I,Pw2*normpdf(I,m2,s2),'r');hold off;

%% apartado d
pw1=0.3; 
m1=20;
s1=3;

pw2=0.7; 
m2=25;
s2=2;

x = [(m1+s1*randn(1,pw1*N)) (m2+s2*randn(1,pw2*N))];
y = [zeros(1,pw1*N) ones(1,pw2*N)];

indices1=find(y==0);  indices2=find(y==1);
m1=mean(x(indices1)); m2=mean(x(indices2));
s1=std(x(indices1));  s2=std(x(indices2));
Pw1=length(indices1)/length(y);
Pw2=length(indices2)/length(y);

A=s1*s1-s2*s2;
B=2*(m1*s2*s2-m2*s1*s1);
C=2*s1*s1*s2*s2*(log(Pw1)-log(Pw2)-log(s1)+log(s2))+s1*s1*m2*m2-s2*s2*m1*m1;

%fronteras
x1=(-B+sqrt(B*B-4*A*C))/2/A; disp(x1);
x2=(-B-sqrt(B*B-4*A*C))/2/A; disp(x2);
figure;
I=5:0.01:40;plot(I,Pw1*normpdf(I,m1,s1));hold on;
plot(I,Pw2*normpdf(I,m2,s2),'r');hold off;

