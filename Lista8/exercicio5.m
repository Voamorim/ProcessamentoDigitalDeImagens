close all
clear all 
clc

pkg load image;

Origbwcs = imread('snowflakes.png');
se3 = strel('disk', 3, 0);
Openbw = imopen(Origbwcs, se3);

figure;
subplot(1, 2, 1), imshow(Origbwcs), title("Imagem original");
subplot(1, 2, 2), imshow(Openbw), title('Imagem aberta (raio = 3)');
