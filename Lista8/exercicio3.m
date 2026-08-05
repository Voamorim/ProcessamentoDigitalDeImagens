close all
clear all
clc

pkg load image;

Origbwct = imread('texto.png');

se2 = strel('line', 11, 90);
Dilatbw = imdilate(Origbwct, se2);

figure;
subplot(2, 2, 1), imshow(Origbwct), title('Imagem original');
subplot(2, 2, 2), imshow(Dilatbw), title('Imagem dilatada (comprimemto = 11 e direção = 90');

se2 = strel('line', 11, 180);
Dilatbw = imdilate(Origbwct, se2);
subplot(2, 2, 3), imshow(Dilatbw), title('Imagem dilatada (comprimemto = 11 e direção = 180');

se2 = strel('line', 20, 90);
Dilatbw = imdilate(Origbwct, se2);
subplot(2, 2, 4), imshow(Dilatbw), title('Imagem dilatada (comprimemto = 20 e direção = 90');
