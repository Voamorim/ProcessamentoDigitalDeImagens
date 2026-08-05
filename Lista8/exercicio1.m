close all
clear all
clc

pkg load image;

Origbwc = imread('circles.gif');
se = strel('disk', 5, 0);
Erobsw = imerode(Origbwc, se);

subplot(2, 2, 1), imshow(Origbwc), title('Imagem original');
subplot(2, 2, 2), imshow(Erobsw), title('Imagem erosionada (raio = 5)');

se = strel('disk', 10, 0);
Erobsw = imerode(Origbwc, se);
subplot(2, 2, 3), imshow(Erobsw), title('Imagem erosionada (raio = 10)');

se = strel('disk', 15, 0);
Erobsw = imerode(Origbwc, se);
subplot(2, 2, 4), imshow(Erobsw), title('Imagem erosionada (raio = 15)');
