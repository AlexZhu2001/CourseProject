clc;clear;close all;
h=animatedline('color','r');
t=linspace(0,1,5000);
y=zeros(1,5000);
omg=2*pi;
tmp=1;
ylim([0.9,1.2]);
xlim([-0.1,0.1]);
m=0;
for i=1:1:1024
    y=y+4/pi*1/(2.*i-1).*sin(omg.*(2.*i-1).*t);
    if mod(i,tmp) == 0
        clearpoints(h);
        addpoints(h,t,y);
        pause(0.5);
        tmp=tmp*2;
        ss=sprintf("No. %d Composition",i);
        title(ss);
        str=sprintf("../figure/fig_7/fig-%d.png",m);
        saveas(h,str);
        m=m+1;
    end
end