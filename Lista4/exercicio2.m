close all
clear all
clc

img_galaxy = imread('imagens/galaxy.jpg');
img_galaxy= imnoise(img_galaxy, "salt & pepper");

filtro_h = ones(3,3)/9;
img_galaxy_filtro_h = uint8(filter2(filtro_h, img_galaxy));

img_galaxy_filtro_med = medfilt2(img_galaxy, [3,3]);

figure;
subplot(1, 3, 1), imshow(img_galaxy), title("Imagem Original");
subplot(1, 3, 2), imshow(img_galaxy_filtro_h), title("Imagem Após Filtro H");
subplot(1, 3, 3), imshow(img_galaxy_filtro_med), title("Imagem Após Filtro Mediana");
