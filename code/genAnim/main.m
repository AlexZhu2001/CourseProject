clc;clear;close all;
% 111[x,y]=im2rect('1.jpg');
[x,y]=readPoints('points.txt');
[xCn,yCn]=calcCn(x,y);
% figure;plot(x,y);
len=length(x);
kernel=2*pi*1i/len;
h=animatedline;
g=animatedline;%('Linestyle','none','marker','.');
for k=1:1:len
    xs=zeros(1,len);
    ys=xs;
    for n=1:1:length(xCn)
        if n==1
            xs(n)=real(xCn(n)*exp(kernel*(k-1)*(n-1)));
            ys(n)=real(yCn(n)*exp(kernel*(k-1)*(n-1)));
        else
            xs(n)=real(xs(n-1)+xCn(n)*exp(kernel*(k-1)*(n-1)));
            ys(n)=real(ys(n-1)+yCn(n)*exp(kernel*(k-1)*(n-1)));
        end
    end
    clearpoints(h);
    addpoints(h,xs,ys);
    addpoints(g,xs(end),ys(end));
    drawnow update;
    pause(0.02);
end
clearpoints(h);

