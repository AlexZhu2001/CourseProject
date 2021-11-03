clc;clear;close all;
len=0.5;
N=10000;
t=linspace(0,1,N);
f1=1./t;
f2=sin(pi./t);
f3=ones(N,1);
while len>1e-7
    ind=t>1-len;
    f3(ind)=f3(ind)*0.5;
    len=len/2;
end
subplot(3,1,1);
plot(t,f1);
ylim([0,200]);
xlim([-0.1,5]);
title("Not absolutely integrable");
subplot(3,1,2);
plot(t,f2);
title("Infinite number of maxima and minima in a single period");
subplot(3,1,3);
plot(t,f3);
ylim([0,1.05]);
title("Infinite number of discontinuities in a single period");
saveas(gcf,"..\figure\fig_6.png");