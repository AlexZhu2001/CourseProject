clear;clc;close all;
N=2000;
t=zeros(N,5);
f=t;
x=t;
f_t=zeros(N,1);
for i=1:1:5
    k=2*i-1;
    x(:,i)=k*ones(N,1);
    t(:,i)=linspace(0,2,N);
    f(:,i)=4/k/pi*sin(k*2*pi*t(:,i));
    f_t=f_t+f(:,i);
end
x=[zeros(N,1) x];
t=[linspace(0,2,N)' t];
f=[f_t f];
figure; 
plot3(t,x,f,'LineWidth',2);
set(gca,'YDir','reverse')%对Y方向反转
grid on;
line(zeros(N,1),linspace(0,10,N),zeros(N,1),'color','black','LineWidth',1);
%plot3(zeros(1000,1),t(:,1),f_t);