close all
clear all
clc

pkg load image;

Origbwct = imread('circles.gif');
se1 = strel('line', 11, 90);
Dilatbw = imdilate(Origbwct, se1);

subplot(2, 2, 1), imshow(Origbwct), title('Imagem original');
subplot(2, 2, 2), imshow(Dilatbw), title('Imagem dilatada (comprimemto = 11 e direção = 90');
