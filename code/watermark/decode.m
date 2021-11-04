clc;clear;close all;
img = double(imread('origin.png'));
%img=img+rand(size(img));
img_watermark = double(imread('wmed.png'));
img_watermark = imresize(img_watermark,size(img));
% if length(size(img_watermark))>2
%     img_watermark=rgb2gray(img_watermark);
% end
wm = fft2(img_watermark)-fft2(img);

figure;
tmp=wm;
imshow(img);
imshow(mat2gray(real(tmp)));
imwrite(mat2gray(real(tmp)),'re.png');