clc;clear;close all;
img = double(imread('origin.png'));
wm = double(imread('wm.png'));
wm = imresize(wm,size(img));
imshow(wm);
fimgre = fft2(img) +wm*10;
imgre = uint8(real(ifft2(fimgre)));

figure;
imshow(imgre);
imwrite(imgre,'wmed.png');