clc;
clear all;
close all;
%%Const Value
N=2000+1;
freq_A=440.010; %%La
freq_C=261.632; %%Do
omg_A=2*pi*freq_A;
omg_C=2*pi*freq_C;
%%Get points
t=linspace(-10/freq_C,10/freq_C,N);
fa=cos(omg_A*t);
fc=cos(omg_C*t);
fsum=fa+fc;
[f,fs]=audioread("audio.wav");
audiot=linspace(0,1,fs);
%%Plot
subplot(4,1,1);
plot(t,fa);
ylim([-1.5 1.5]);
yticks([-1 0 1]);
title('440.010Hz La');
grid on;
subplot(4,1,2);
plot(t,fc);
ylim([-1.5 1.5]);
yticks([-1 0 1]);
title('261.632Hz Do');
grid on;
subplot(4,1,3);
plot(t,fsum);
ylim([-2.5 2.5]);
yticks([-1 0 1]);
title('Sum of above');
grid on;
subplot(4,1,4);
plot(audiot,f(1:fs));
ylim([min(f(1:fs)),max(f(1:fs))]);
yticks([-1 0 1]);
title('Random sound');
grid on;
saveas(gcf,'../figure/fig_1.png');