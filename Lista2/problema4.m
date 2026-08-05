close all
clear all
clc

img_baboon = imread("Imagens/baboon.png");
img_butterfly = imread("Imagens/butterfly.png");

img_baboon_double = im2double(img_baboon);
img_butterfly_double = im2double(img_butterfly);

img_combinacao_1 = img_baboon_double * 0.2 + img_butterfly_double * 0.8;
img_combinacao_2 = img_baboon_double * 0.5 + img_butterfly_double * 0.5;
img_combinacao_3 = img_baboon_double * 0.8 + img_butterfly_double * 0.2;

subplot(1, 3, 1), imshow(img_combinacao_1), title("Baboon * 0.2 + Butterfly * 0.8");
subplot(1, 3, 2), imshow(img_combinacao_2), title("Baboon * 0.5 + Butterfly * 0.5");
subplot(1, 3, 3), imshow(img_combinacao_3), title("Baboon * 0.8 + Butterfly * 0.2");

