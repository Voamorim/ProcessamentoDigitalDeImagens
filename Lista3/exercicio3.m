close all
clear all
clc

img_rice = imread("Imagens/rice.png");
img_menino = imread("Imagens/menino.png");
img_menino = rgb2gray(img_menino);

img_rice_eq = histeq(img_rice);
img_menino_eq = histeq(img_menino);

figure;
subplot(2, 2, 1), imshow(img_rice), title("Imagem rice original");
subplot(2, 2, 2), hist(img_rice), title("Histograma rice original");
subplot(2, 2, 3), imshow(img_rice_eq), title("Imagem rice equalizada");
subplot(2, 2, 4), hist(img_rice_eq), title("Histograma rice equalizada");

figure;
subplot(2, 2, 1), imshow(img_menino), title("Imagem menino original");
subplot(2, 2, 2), hist(img_menino), title("Histograma menino original");
subplot(2, 2, 3), imshow(img_menino_eq), title("Imagem menino equalizada");
subplot(2, 2, 4), hist(img_menino_eq), title("Histograma menino equalizada");
