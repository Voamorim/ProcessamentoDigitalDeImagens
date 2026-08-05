close all
clear all
clc

A = zeros(300, 300);
A(25:175, 125:175) = 1;

B = zeros(300, 300);
B(125:175, 25:175) = 1;

C = zeros(300, 300);
C(150:300, 150:300) = 1;

SAC = A - C;
SCA = C - A;

SBC = B - C;
SCB = C - B;

SAB = A - B;
SBA = B - A;

subplot(2, 3, 1), imshow(SAC),
title('Subtracao A - C')

subplot(2, 3, 2), imshow(SBC),
title('Subtracao B - C')

subplot(2, 3, 3), imshow(SAB),
title('Subtracao A - B')

subplot(2, 3, 4), imshow(SCA),
title('Subtracao C - A')

subplot(2, 3, 5), imshow(SCB),
title('Subtracao C - B')

subplot(2, 3, 6), imshow(SBA),
title('Subtracao B - A')

% Com base nos resultados observados, a ordem dos fatores altera
% os resultados obtidos.
