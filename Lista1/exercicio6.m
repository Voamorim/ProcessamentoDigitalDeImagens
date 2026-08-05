clear all
close all
clc

A = zeros(300, 300);
A(25:175, 125:175) = 1;

B = zeros(300, 300);
B(125:175, 25:175) = 1;

C = zeros(300, 300);
C(150:300, 150:300) = 1;

DAB = A ./ B;
DBA = B ./ A;

DAC = A ./ C;
DCA = C ./ A;

DBC = B ./ C;
DCB = C ./ B;

subplot(2,3,1), imshow(DAB),
title('Divisao A / B')

subplot(2,3,2), imshow(DAC),
title('Divisao A / C')

subplot(2,3,3), imshow(DBC),
title('Divisao B / C')

subplot(2,3,4), imshow(DBA),
title('Divisao B / A')

subplot(2,3,5), imshow(DCA),
title('Divisao C / A')

subplot(2,3,6), imshow(DCB),
title('Divisao C / B')
