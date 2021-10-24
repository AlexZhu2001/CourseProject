clc;clear;close all;

N=1000;
x=linspace(-3,3,N);
omg=2*pi*1;

f=square(omg*x);
sin_base=sin(omg*x);

subplot(3,1,1);
plot(x,f);
title('Square Wave')
xlim([-3,3]);
ylim([-1.5,1.5]);
xticks(-3:1:3);
yticks(-1:1:1);
grid on;

subplot(3,1,2);
plot(x,sin_base);
title('Sine Wave')
xlim([-3,3]);
ylim([-1.5,1.5]);
xticks(-3:1:3);
yticks(-1:1:1);
grid on;

subplot(3,1,3);
fif_sin=zeros(1,length(x));
hold on;
xlim([-3,3]);
ylim([-1.5,1.5]);
xticks(-3:1:3);
yticks(-1:1:1);
grid on;
hp=plot(x,0);
for i=1:1:10
    delete(hp);
    fif_sin=fif_sin+4/pi*1/(2.*i-1).*sin(omg.*(2.*i-1).*x);
    ss=sprintf("No.%d Composition",i);
    title(ss)
    hp=plot(x,fif_sin);
    pause(0.5);
    str=sprintf("../figure/fig_2/fig-%d.png",i);
    saveas(hp,str);
end
