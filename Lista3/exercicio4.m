close all
clear all
clc

img_lenna = imread("Imagens/lenna.png");

img_lenna_16 = histeq(img_lenna, 16);

figure;
subplot(2, 2, 1), imshow(img_lenna), title("Lenna original");
subplot(2, 2, 2), hist(img_lenna), title("Histograma Lenna original");
subplot(2, 2, 3), imshow(img_lenna_16), title("Lenna 16 niveis");
subplot(2, 2, 4), hist(img_lenna_16), title("Histograma Lenna 16 niveis");
