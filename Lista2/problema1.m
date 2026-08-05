close all
clear all
clc

img = imread('Imagens/baboon.png');

img = 255 - img;

imshow(img);
