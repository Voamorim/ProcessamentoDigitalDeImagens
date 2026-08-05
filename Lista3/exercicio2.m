close all
clear all
clc

img_lenina = imread("Imagens/lenna.png");

img_lenina_eq = histeq(img_lenina);

subplot(2, 2, 1), imshow(img_lenina), title("Lenna original");
subplot(2, 2, 2), hist(img_lenina), title("Histograma imagem original");
subplot(2, 2, 3), imshow(img_lenina_eq), title("Lenna equalizada");
subplot(2, 2, 4), hist(img_lenina_eq), title("Histograma imagem equalizada");
