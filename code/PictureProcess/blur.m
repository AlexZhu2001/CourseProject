fixed_size = 512;
coeff = 0.1;
low_pass_fir = zeros(fixed_size,fixed_size);
osize=floor(coeff*fixed_size/2);
st = floor(fixed_size/2 - osize);
en = floor(fixed_size/2 + osize);
low_pass_fir(st:en,st:en) = 1;

pic = rgb2gray(imread('lena.jpg'));
pic = imresize(pic,[fixed_size,fixed_size]);
subplot(2,2,1);
imshow(pic);
title("Original Picture");

f_pic = fftshift(fft2(pic));
subplot(2,2,2);
imshow(log(f_pic)+1,[]);
title("Frequency");

f_pro = f_pic .* low_pass_fir;
subplot(2,2,3);
imshow(log(f_pro)+1,[]);
title("Low pass filter");

pic_p = real(ifft2(ifftshift(f_pro)));
subplot(2,2,4);
imshow(pic_p,[]);
title("Blurred picture");