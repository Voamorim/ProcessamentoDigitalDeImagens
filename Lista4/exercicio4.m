close all
clear all
clc

pkg load image

img_galaxy = rgb2gray(imread('imagens/peppers.png'));

filtro_h = ones(5,5)/25;
img_galaxy_filtro_h = filter2(filtro_h, img_galaxy);


img_galaxy_filtro_med = medfilt2(img_galaxy, [5,5]);

figure;
subplot(1, 3, 1), imshow(img_galaxy), title("Imagem Original");
subplot(1, 3, 2), imshow(uint8(img_galaxy_filtro_h)), title("Imagem Após Filtro H");
subplot(1, 3, 3), imshow(img_galaxy_filtro_med), title("Imagem Após Filtro Mediana");
