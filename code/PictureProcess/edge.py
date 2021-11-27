# -*- coding: utf-8 -*-
import cv2 as cv
import numpy as np
from matplotlib import pyplot as plt

#读取图像
img = cv.imread('lena.png', 0)

#傅里叶变换
f = np.fft.fft2(img)
fshift = np.fft.fftshift(f)
fshift_tmp = np.abs(np.log(fshift+1))

#设置高通滤波器
rows, cols = img.shape
crow,ccol = int(rows/2), int(cols/2)
fshift[crow-30:crow+30, ccol-30:ccol+30] = 0
fshift_tmp2 = np.abs(np.log(fshift+1))

#傅里叶逆变换
ishift = np.fft.ifftshift(fshift)
iimg = np.fft.ifft2(ishift)
iimg = np.abs(iimg)

#显示原始图像和高通滤波处理图像
plt.subplot(221), plt.imshow(img, 'gray'), plt.title('Original Image')
plt.axis('off')
plt.subplot(222), plt.imshow(fshift_tmp, 'gray'), plt.title('Original Image Frequency')
plt.axis('off')
plt.subplot(223), plt.imshow(fshift_tmp2, 'gray'), plt.title('After Low-pass Filter')
plt.axis('off')
plt.subplot(224), plt.imshow(iimg, 'gray'), plt.title('Result Image')
plt.axis('off')
plt.savefig("edge.png")
plt.show()
