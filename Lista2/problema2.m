close all
clear all
clc

img = imread('Imagens/baboon.png');

img_double = im2double(img);

gamma = 1/1.5;

img_double_1 = img_double .^ gamma;

gamma = 1/2.5;

img_double_2 = img_double .^ gamma;

gamma = 1/3.5;

img_double_3 = img_double .^ gamma;

figure;
subplot(1, 3, 1), imshow(img_double_1), title("Gamma = 1.5");
subplot(1, 3, 2), imshow(img_double_2), title("Gamma = 2.5");
subplot(1, 3, 3), imshow(img_double_3), title("Gamma = 3.5");
