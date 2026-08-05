clear all
close all
clc

A = zeros(300, 300);
A(25:175, 125:175) = 1;

B = zeros(300, 300);
B(125:175, 25:175) = 1;

C = zeros(300, 300);
C(150:300, 150:300) = 1;

SAB = A + B;
SAC = A + C;
SBC = B + C;

subplot(2,3,1), imshow(A),
title('Imagem A')

subplot(2,3,2), imshow(B),
title('Imagem B')

subplot(2,3,3), imshow(C),
title('Imagem C')

subplot(2, 3, 4), imshow(SAB),
title('Imagem SAB')

subplot(2, 3, 5), imshow(SAC),
title('Imagem SAC')
title('Imagem SAB')

subplot(2, 3, 5),
subplot(2, 3, 6), imshow(SBC),
title('Imagem SBC')

close all

SBA = B + A;
SCA = C + A;
SCB = C + B;

dif_SBA_SAB = SAB - SBA;
dif_SAC_SCA = SAC - SCA;
dif_SBC_SCB = SBC - SCB;

subplot(1, 3, 1), imshow(dif_SBA_SAB),
title('Diferença ordem A + B')

subplot(1, 3, 2), imshow(dif_SAC_SCA),
title('Diferenca ordem A + C')

subplot(1, 3, 3), imshow(dif_SBC_SCB),
title('Diferenca ordem B + C')

