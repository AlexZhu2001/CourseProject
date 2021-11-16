function [xCn,yCn] = calcCn(x,y)
    n=length(x);
    xCn=fft(x)*2./n;
    yCn=fft(y)*2./n;
end

