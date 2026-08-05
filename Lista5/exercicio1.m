close all
clear all
clc

pkg load image

img_lena = imread('Imagens/lenaCor.bmp');
img_lena = rgb2gray(img_lena);

Hp_mascara = [-1 -1 -1, -1 8 -1, -1 -1 -1];
img_lena_depois = filter2(Hp_mascara, img_lena);

figure;
subplot(1, 2, 1), imshow(img_lena), title("Lena Antes");
subplot(1, 2, 2), imshow(img_lena_depois), title("Lena Depois");
