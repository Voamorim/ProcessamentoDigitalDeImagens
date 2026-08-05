close all
clear all
clc

pkg load image;

Origbwc = imread('circles.gif');
se1 = strel('square', 12);

Erobsw = imerode(Origbwc, se1);

figure;
subplot(2, 2, 1), imshow(Origbwc), title('Imagem original');
subplot(2, 2, 2), imshow(Erobsw), title('Imagem erosionada (Tipo square e r = 12)');

se = strel('disk', 5, 0);
Erobsw = imerode(Origbwc, se);
subplot(2, 2, 3), imshow(Erobsw), title('Imagem erosionada (Tipo disk e r = 5)');
