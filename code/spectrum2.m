clear;clc;close all;
N=6;
f=zeros(N,1);
for i=1:1:N
   f(i)= (-1)^int16(rand*10)*mod(rand*11,3);
end
f=[0;f];
subplot(121);
x=0:1:N;
stem(x,f);
ylim([-3,3]);
subplot(122);
x=-N:1:N;
f_2=[-flip(f);f(2:end)];
stem(x,f_2);
ylim([-3,3]);
