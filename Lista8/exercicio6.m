close all
clear all 
clc

pkg load image;

Origbwcs = imread('snowflakes.png');
se4 = strel('disk', 10, 0);
Closbw = imclose(Origbwcs, se4);

se3 = strel('disk', 3, 0);
Openbw = imopen(Origbwcs, se3);

figure;
subplot(1, 3, 1), imshow(Origbwcs), title("Imagem original");
subplot(1, 3, 2), imshow(Openbw), title('Imagem aberta (raio = 3)');
subplot(1, 3, 3), imshow(Closbw), title('Imagem fechada (raio = 10)');
