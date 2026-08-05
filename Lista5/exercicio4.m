close all
clear all
clc

pkg load image

img_cameraman = imread('Imagens/cameraman.tif');

filtro_gaussiano = fspecial("gaussian", [3,3], 1.5);

img_cameraman_filtrada = imfilter(img_cameraman, filtro_gaussiano);

filtro_laplaciano = [0 1 0, 1 -4 1, 0 1 0];

bordas = imfilter(img_cameraman_filtrada, filtro_laplaciano);

filtro_sobel = fspecial('sobel');
bordas_sobel = imfilter(img_cameraman, filtro_sobel);
img_cameraman_sobel = img_cameraman + 0.3 * abs(bordas_sobel);

figure;
subplot(1, 4, 1); imshow(img_cameraman), title("Imagem Original");
subplot(1, 4, 2); imshow(img_cameraman_filtrada), title("Imagem filtro gaussiano");
subplot(1, 4, 3); imshow(bordas), title("Imagem filtro laplaciano");
subplot(1, 4, 4); imshow(img_cameraman_sobel), title("Imagem filtro sobel");
