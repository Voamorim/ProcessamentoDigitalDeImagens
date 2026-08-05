close all
clear all
clc

pkg load image;

img_peppers_rgb = imread('imagens/peppers.png');

figure;
imshow(img_peppers_rgb), title("Imagem Peppers RGB");

img_peppers_rb = rgb2gray(img_peppers_rgb);

filtro_h = ones(3,3)/9;
img_peppers_rb_filtro_h = uint8(filter2(filtro_h, img_peppers_rb));

img_peppers_rb_filtro_med = medfilt2(img_peppers_rb, [3,3]);

figure;
subplot(1, 3, 1), imshow(img_peppers_rb), title("Imagem Peppers P&B");
subplot(1, 3, 2), imshow(img_peppers_rb_filtro_h), title("Imagem Peppers P&B Filtro H");
subplot(1, 3, 3), imshow(img_peppers_rb_filtro_med), title("Image Peppers P&B Filtro Med");

img_peppers_rb = imnoise(img_peppers_rb, 'salt & pepper');
filtro_h = ones(3,3)/9;
img_peppers_rb_filtro_h = uint8(filter2(filtro_h, img_peppers_rb));

img_peppers_rb_filtro_med = medfilt2(img_peppers_rb, [3,3]);

figure;
subplot(1, 3, 1), imshow(img_peppers_rb), title("Imagem Peppers P&B");
subplot(1, 3, 2), imshow(img_peppers_rb_filtro_h), title("Imagem Peppers P&B Filtro H");
subplot(1, 3, 3), imshow(img_peppers_rb_filtro_med), title("Image Peppers P&B Filtro Med");

