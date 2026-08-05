clear all
close all
clc

A = zeros(300, 300);
A(25:175, 125:175) = 1;

B = zeros(300, 300);
B(125:175, 25:175) = 1;

C = zeros(300, 300);
C(150:300, 150:300) = 1;

subplot(1,3,1), imshow(A),
title('Imagem A')

subplot(1,3,2), imshow(B),
title('Imagem B')

subplot(1,3,3), imshow(C),
title('Imagem C')


