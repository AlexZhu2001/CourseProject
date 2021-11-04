clc;clear;close all;
t=linspace(0,2,1000);
b_omg=2*pi;
fftr=[1,1/3,1/5,1/7];
fftr=fftr./pi.*4/2;
h=animatedline('color','blue');
h2=animatedline('color','red','LineWidth',2);
hn=[animatedline('color','green','LineWidth',1.2) 
    animatedline('color',[17 150 238]/255,'LineWidth',1.2) 
    animatedline('color',[230 189 26]/255,'LineWidth',1.2) 
    animatedline('color',[204 0 255]/255,'LineWidth',1.2)];
ylim([-2 2]);
xlim([-3.14 2.86]);
set(gcf,'position',[100,100,6*100,4*100]);
s=0;
axis off;
for k=t
    l=0;
    x=zeros(1,4);
    y=zeros(1,4);
    cx=zeros(4,length(t));
    cy=zeros(4,length(t));
    for m=1:4
        omg=b_omg*(2*m-1);
        l=fftr(m);
        if m==1
            x(1)=l*cos(omg*k);
            y(1)=l*sin(omg*k);
            cx(1,:)=l*cos(2*pi*t);
            cy(1,:)=l*sin(2*pi*t);
        else
            x(m)=x(m-1)+l*cos(omg*k);
            y(m)=y(m-1)+l*sin(omg*k);
            cx(m,:)=x(m-1)+l*cos(2*pi*t);
            cy(m,:)=y(m-1)+l*sin(2*pi*t);
        end
    end
    clearpoints(h);
    addpoints(h,[[0 x]-sum(fftr) k],[0 y y(end)]);
    addpoints(h2,k,y(end));
    for i=1:4
        clearpoints(hn(i));
        addpoints(hn(i),cx(i,:)-sum(fftr),cy(i,:));
    end
    drawnow;
    if mod(s-1,5)==0
        ss=sprintf("../figure/fig_8/fig-%d.png",uint8(s/5));
        saveas(gcf,ss);
        %s=s+1;
    end
    s=s+1;
    pause(0.005);
end
