clear all
close all
clc

lenaCor = imread('lenaCor.bmp');

imshow(lenaCor)

figure, imshow(lenaCor(:,:,1))

[altura, largura, canais] = size(lenaCor)

pixeis_a_remover = 50
lenaCorRecortada = lenaCor(:,
                           pixeis_a_remover + 1 : largura - pixeis_a_remover,
                           :);

figure;
subplot(1,2,1), imshow(lenaCor), title('Lena Original')
subplot(1,2,2), imshow(lenaCorRecortada), title('Lena Recortada')

canal_vermelho = lenaCor(:,:,1);
canal_verde = lenaCor(:,:, 2);
canal_azul = lenaCor(:,:, 3);

lenaMedia = (double(canal_verde + canal_vermelho + canal_azul) / 3);
lenaMedia = uint8(lenaMedia);

figure;
imshow(lenaMedia), title('Lena Media')
