close all
clear all
clc

pkg load image

img = imread('imagens/mricerebro2.jpg');
s = size(img)

if numel(s) > 2
    img = rgb2gray(img);
endif

figure;
imshow(img), title('Imagem original')

% Suaviza e realça a imagem original
img_suavizada = medfilt2(img, [3, 3]);
img_realcada = imadjust(img_suavizada);
figure;
subplot(1, 3, 1);
imshow(img_realcada), title("Imagem realçada");
subplot(1, 3, 2);
imshow(img_suavizada), title("Imagem suavizada");

% Convente a imagem para uma imagem binária
thresh_otimo = graythresh(img_realcada);
disp(thresh_otimo);
img_binaria = im2bw(img_realcada, 0.5);
subplot(1, 3, 3);
imshow(img_binaria);

se_detalhe = strel('square', 1); % mantem detalhes e bordas
se_ruido = strel('disk', 1, 0); % Remove ruido pequeno e suaviza os contornos
se_fech = strel('disk', 1, 0); % fecha buracos maiores
se_grad = strel('diamond', 1); % realca bordas finas

% Aplica as operações morfológicas na imagem usando o elemento estruturante
imagem_dilatada = imdilate(img_binaria, se_detalhe);
imagem_erodida = imerode(img_binaria, se_detalhe);
imagem_aberta = imopen(img_binaria, se_ruido);
imagem_fechada = imclose(img_binaria, se_fech);

grad = imdilate(img_binaria, se_grad) - imerode(img_binaria, se_grad);

figure;
subplot(2,3,1), imshow(img_binaria), title('Binária');
subplot(2,3,2), imshow(imagem_dilatada), title('Dilatação');
subplot(2,3,3), imshow(imagem_erodida), title('Erosão');
subplot(2,3,4), imshow(imagem_aberta), title('Abertura');
subplot(2,3,5), imshow(imagem_fechada), title('Fechamento');
subplot(2,3,6), imshow(grad), title('Gradiente');

area_total = sum(img_binaria(:));
[labels, num_objetos] = bwlabel(imagem_aberta);
props = regionprops(labels, 'Area');
areas = [props.Area];
area_media = mean(areas);
area_maxima = max(areas);

area_antes = sum(img_binaria(:));
area_depois = sum(imagem_aberta(:));
diferenca = area_depois - area_antes;

fprintf('Esses resultados serão salvos para o arquivo relatorio_morfologia.txt!')
fprintf('Área total: %d pixels\n', area_total);
fprintf('Número de estruturas: %d\n', num_objetos);
fprintf('Área média: %.1f pixels\n', area_media);
fprintf('Maior área: %d pixels\n', area_maxima);
fprintf('Diferença de área (depois - antes): %d pixels\n', diferenca);

figure;
valores = [area_antes, area_depois, diferenca];
nomes = {'Antes', 'Depois', 'Diferença'};
bar(valores);
set(gca, 'XTickLabel', nomes);
title('Comparação de Áreas');
ylabel('Pixels');

figure;
hist(areas, 20);
title('Distribuição de Tamanhos das Estruturas');
xlabel('Área (pixels)');
ylabel('Frequência');

fid = fopen('relatorio_morfologia.txt', 'w');
fprintf(fid, 'Imagem: mricerebro2.jpg\n');
fprintf(fid, 'Data: %s\n\n', datestr(now));
fprintf(fid, 'Área total: %d pixels\n', area_total);
fprintf(fid, 'Número de estruturas: %d\n', num_objetos);
fprintf(fid, 'Área média: %.1f pixels\n', area_media);
fprintf(fid, 'Maior área: %d pixels\n', area_maxima);
fprintf(fid, 'Diferença de área: %d pixels\n', diferenca);
fclose(fid);