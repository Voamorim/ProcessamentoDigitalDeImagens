close all
clear all
clc

img_crianca = imread("Imagens/butterfly.png");

r_min = min(img_crianca(:));
r_max = max(img_crianca(:));
L_min = 0;
L_max = 255;

img_nova = (img_crianca - r_min) * ((L_max - L_min) / (r_max - r_min)) + L_min;

figure;
subplot(1, 2, 1), imshow(img_crianca), title("Antes");
subplot(1, 2, 2), imshow(img_nova), title("Depois");
