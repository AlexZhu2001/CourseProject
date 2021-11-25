clc;clear;close all;
N=10000;
T=16;
tau=1;
t=linspace(-tau/2-0.5,T+0.5*tau+0.5,N);
f=t*0;
ind = t>=-0.5*tau & t<0.5*tau;
f(ind)=1;
ind = t>=T-0.5*tau & t<0.5*tau+T;
f(ind)=1;

omg=2*pi/T;
n=-200:200;
n=n*omg;
spec=tau/T*sinc(n*tau/2/pi);

t0=linspace(-200,200,N);
t0=t0*omg;
sl=tau/T*sinc(t0*tau/2/pi);

subplot(1,2,1);
plot(t,f);
ylim([0,1.5]);
subplot(1,2,2);
hold on;
stem(n,spec,'fill','-');
plot(t0,sl,'blue--');
ylim([min(spec),max(spec)]);
xlim([-30,30]);