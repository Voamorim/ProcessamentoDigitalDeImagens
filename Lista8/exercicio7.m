close all
clear all
clc

pkg load image;

Origbwcsa = imread('aneis.png');
se4 = strel('disk', 10, 0);
ClosbwA = imclose(Origbwcsa, se4);

figure;
subplot(1, 4, 1), imshow(Origbwcsa), title("Imagem original");
subplot(1, 4, 2), imshow(ClosbwA), title('Imagem fechada (raio = 10)');
se4 = strel('disk', 5, 0);
ClosbwA = imclose(Origbwcsa, se4);
subplot(1, 4, 3), imshow(ClosbwA), title('Imagem fechada (raio = 5)');
se4 = strel('disk', 15, 0);
ClosbwA = imclose(Origbwcsa, se4);
subplot(1, 4, 4), imshow(ClosbwA), title('Imagem fechada (raio = 15)');
