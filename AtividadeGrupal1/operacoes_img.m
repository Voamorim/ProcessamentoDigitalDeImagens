clear all
close all
clc

img_pb = imread('figuras/mao1.jpg');
img_pb_depois = img_pb + 50;

% Remove o overflow
img_pb_depois = min(img_pb_depois, 255);

subplot(1, 2, 1), imshow(img_pb), title('Imagem antes');
subplot(1, 2, 2), imshow(img_pb_depois), title('Imagem com realce');

clear all
close all
clc

img_doc_double = im2double(imread('figuras/fogo.jpg'));
img_doc_double_depois = img_doc_double * 1.5;

img_doc_double_depois_sem_overflow = min(img_doc_double, 1.0);

subplot(1, 3, 1), imshow(img_doc_double), title('Imagem antes da multiplicação');
subplot(1, 3, 2), imshow(img_doc_double_depois), title('Imagem após multiplicação');
subplot(1, 3, 3), imshow(img_doc_double_depois_sem_overflow), title('Imagem sem overflow');

clear all
close all
clc

img_estrada1 = imread('figuras/estrada.jpg');
img_estrada2 = imread('figuras/estrada2.jpg');

diff = abs(img_estrada1 - img_estrada2);

diff = diff + 100;
diff = min(diff, 255);

subplot(1, 3, 1), imshow(img_estrada1), title('Estrada 1');
subplot(1, 3, 2), imshow(img_estrada2), title('Estrada 2');
subplot(1, 3, 3), imshow(diff), title('Diferença entre as imagens');
