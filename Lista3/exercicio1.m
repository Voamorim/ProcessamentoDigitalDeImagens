close all
clear all
clc

imagem_beans = imread("Imagens/beans.png");
imhist(imagem_beans);

sub_imagem_beans = imagem_beans - 100;

r_min = min(sub_imagem_beans(:));
r_max = max(sub_imagem_beans(:));
L_min = 0;
L_max = 255;

new_image_beans = (sub_imagem_beans - r_min) * ((L_max - L_min) / (r_max - r_min)) + L_min;

figure;
subplot(1, 3, 1), imshow(imagem_beans), title("Imagem original");
subplot(1, 3, 2), imshow(sub_imagem_beans), title("Imagem subtraida 100");
subplot(1, 3, 3), imshow(new_image_beans), title("Imagem pos alongamento de contraste");
