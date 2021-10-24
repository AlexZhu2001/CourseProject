clc;clear;close all;
N=1000;
t=linspace(0,2,N);
omg=2*pi*4;
subplot(2,2,[1,2]);
cos_x=linspace(0,2,N);
f_cos=1+cos(omg*cos_x);
plot(cos_x,f_cos);


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
    fx=f_cos.*exp(-1j*2*pi*f*t);
    addpoints(h,real(fx),imag(fx));
    drawnow update;
    pause(0.01);
    
    subplot(2,2,4);
    x_pos=real(sum(fx))/length(fx);
    addpoints(h2,f,x_pos);
    
    F(m) = getframe(gcf);
    m=m+1;
end
video = VideoWriter('circle.avi','Uncompressed AVI');
video.FrameRate = 60;
open(video);
writeVideo(video,F);
close(video)