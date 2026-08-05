clear all
close all
clc

A = zeros(300, 300);
A(25:175, 125:175) = 1;

B = zeros(300, 300);
B(125:175, 25:175) = 1;

C = zeros(300, 300);
C(150:300, 150:300) = 1;

MAB = A .* B;
MBA = B .* A;

MAC = A .* C;
MCA = C .* A;

MBC = B .* C;
MCB = C .* B;

subplot(2,3,1), imshow(MAB),
title('Mutitplicacao A * B')

subplot(2,3,2), imshow(MAC),
title('Multiplicacao A * C')

subplot(2,3,3), imshow(MBC),
title('Multiplicacao B * C')

subplot(2,3,4), imshow(MBA),
title('Multiplicacao B * A')

subplot(2,3,5), imshow(MCA),
title('Multiplicacao C * A')

subplot(2,3,6), imshow(MCB),
title('Multiplicacao C * B')


