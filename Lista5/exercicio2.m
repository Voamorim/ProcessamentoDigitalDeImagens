close all
clear all
clc

pkg load image

img_lena = imread('Imagens/lenaCor.bmp');
img_lena = rgb2gray(img_lena);

filtro_robert = [1 0, 0 -1];
img_lena_depois = filter2(filtro_robert, img_lena);

figure;
subplot(1, 2, 1), imshow(img_lena), title("Imagem Lena Antes");
subplot(1, 2, 2), imshow(img_lena_depois), title("Imagem Lena Depois");
