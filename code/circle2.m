clc;clear;close all;
N=1000;
t=linspace(0,2,N);
omg1=2*pi*3;
omg2=2*pi*5;
subplot(2,2,[1,2]);
f_cos1=1+cos(omg1*t);
f_cos2=1+cos(omg2*t);
f_com=(f_cos1+f_cos2)/2;
plot(t,f_com);


hold on;
subplot(2,2,3);
xlim([-2.5,2.5]);
ylim([-2.5,2.5]);
h=animatedline;
subplot(2,2,4);
xlim([0,6]);
ylim([-0.5,1.2]);
h2=animatedline;
m=1;
for f=0:0.01:6
    subplot(2,2,3);
    clearpoints(h);
    ss=sprintf("freq:%f Hz",f);
    title(ss);
    fx=f_com.*exp(-1j*2*pi*f*t);
    addpoints(h,real(fx),imag(fx));
    drawnow update;
    pause(0.01);
    
    subplot(2,2,4);
    x_pos=real(sum(fx))/length(fx);
    addpoints(h2,f,x_pos);
    
    F(m) = getframe(gcf);
    m=m+1;
end
video = VideoWriter('circle2.avi','Uncompressed AVI');
video.FrameRate = 60;
open(video);
writeVideo(video,F);
close(video)