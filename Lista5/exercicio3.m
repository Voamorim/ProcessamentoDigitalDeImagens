close all
clear all
clc

pkg load image

img_lena = imread('Imagens/lenaCor.bmp');
img_lena = rgb2gray(img_lena);

filtro_prewitt = fspecial('prewitt');
img_lena_prewitt = filter2(filtro_prewitt, img_lena);

filtro_sobel = fspecial('sobel');
img_lena_sobel = filter2(filtro_sobel, img_lena);

figure;
subplot(1, 3, 1), imshow(img_lena), title('Lena antes');
subplot(1, 3, 2), imshow(img_lena_prewitt), title('Lena prewitt');
subplot(1, 3, 3), imshow(img_lena_sobel), title('Lena sobel');
