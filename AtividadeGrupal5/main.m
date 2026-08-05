% Grupo: Leonardo Guimarães de Oliveira, Vítor Oliveira Amorim, Murilo Martins Marques

clc;
clear all;
close all;
pkg load image;

function compressed = rle_binary(imagem, varredura)
    % Converte a imagem para vetor linha

    if varredura
      vetor = imagem';
    else
      vetor = imagem;
    endif


    vetor = vetor(:);   % agora lineariza em ordem por linhas



    compressed = [];
    count = 1;

    for i = 2:length(vetor)
        if vetor(i) == vetor(i-1)
            count = count + 1;
        else
            compressed = [compressed, vetor(i-1), count];

            count = 1;
        end
    end

    % Adiciona o último run
    compressed = [compressed, vetor(end), count];
end

function imagem = decode_rle_binary(compressed, linhas, colunas)
    imagem = [];

    for i = 1:2:length(compressed)
        valor = compressed(i);
        contador = compressed(i+1);
        imagem = [imagem, valor * ones(1, contador)];
    end

    imagem = reshape(imagem, linhas, colunas);
end

function compressed = rle_gray(imagem, varredura)
    % Converte para vetor considerando varredura por linha
    if varredura
      vetor = imagem';
    else
      vetor = imagem;
    endif

    vetor = vetor(:)';

    compressed = [];

    if isempty(vetor)
        return;
    end

    valor_atual = vetor(1);
    count = 1;

    for i = 2:length(vetor)
        if vetor(i) == valor_atual && count < 255
            count = count + 1;
        else
            compressed = [compressed, valor_atual, count];
            valor_atual = vetor(i);
            count = 1;
        end
    end

    compressed = [compressed, valor_atual, count];
end

function imagem = decode_rle_gray(compressed, linhas, colunas)
    if isempty(compressed)
        imagem = [];
        return;
    end

    imagem = [];

    for i = 1:2:length(compressed)
        valor = compressed(i);
        contador = compressed(i+1);
        imagem = [imagem, valor * ones(1, contador)];
    end

    % Remodela para dimensões originais
    imagem = reshape(imagem, colunas, linhas)';
end

function taxa = calcular_taxa_compressao(original, comprimido)
    bits_original = numel(original) * 8; % Assumindo 8 bits por pixel
    bits_comprimido = numel(comprimido) * 8; % Cada elemento também com 8 bits
    taxa = bits_original / bits_comprimido;
end

function relatorio_desempenho(imagem, compressed, nome)
    fprintf('\n=== %s ===\n', nome);
    fprintf('Dimensões: %dx%d\n', size(imagem,1), size(imagem,2));
    fprintf('Tamanho original: %d pixels\n', numel(imagem));
    fprintf('Tamanho comprimido: %d elementos\n', numel(compressed));
    fprintf('Taxa de compressão: %.2f:1\n', calcular_taxa_compressao(imagem, compressed));
    fprintf('Redução: %.1f%%\n', (1 - numel(compressed)/numel(imagem)) * 100);
end

% Cenário A - Imagem Binária Ideal
imagem_ideal = zeros(10,10);
imagem_ideal(3:7, 3:7) = 1;

imagem_ideal_comprimida_c = rle_binary(imagem_ideal, 0);
relatorio_desempenho(imagem_ideal, imagem_ideal_comprimida_c, "Cenário A - Imagem Binária Ideal [Colunas]");

imagem_ideal_comprimida_l = rle_binary(imagem_ideal, 1);
relatorio_desempenho(imagem_ideal, imagem_ideal_comprimida_l, "Cenário A - Imagem Binária Ideal [Linhas]");

subplot(5, 3, 1), imshow(imagem_ideal), title("Imagem Binária Ideal Original (Cenário A)");
subplot(5, 3, 2), imshow(decode_rle_binary(imagem_ideal_comprimida_c, 10, 10)), title("Imagem Binária Ideal Comprimida por Colunas (Cenário A)");
subplot(5, 3, 3), imshow(decode_rle_binary(imagem_ideal_comprimida_l, 10, 10)'), title("Imagem Binária Ideal Comprimida por Linhas (Cenário A)");

% Cenário B - Imagem Binária
imagem_ruim = [
0 0 0 1 1 1 1 0;
0 0 1 1 1 0 0 0;
1 1 1 1 0 0 1 1;
0 0 0 0 0 1 1 1
];
imagem_ruim_comprimida_c = rle_binary(imagem_ruim, 0);
relatorio_desempenho(imagem_ruim, imagem_ruim_comprimida_c, "Cenário B - Imagem Binária [Colunas]");

imagem_ruim_comprimida_l = rle_binary(imagem_ruim, 1);
relatorio_desempenho(imagem_ruim, imagem_ruim_comprimida_l, "Cenário B - Imagem Binária [Linhas]");

subplot(5, 3, 4), imshow(imagem_ruim), title("Imagem Binária Original (Cenário B)");
subplot(5, 3, 5), imshow(decode_rle_binary(imagem_ruim_comprimida_c, 4, 8)), title("Imagem Binária Comprimida por Colunas (Cenário B)");
subplot(5, 3, 6), imshow(decode_rle_binary(imagem_ruim_comprimida_l, 8, 4)'), title("Iclearmagem Binária Comprimida por Linhas (Cenário B)");

% Cenário C - Imagem com Padrão Complexo
imagem_ruim = checkerboard(4) > 0.5;

imagem_ruim_comprimida_c = rle_binary(imagem_ruim, 0);
relatorio_desempenho(imagem_ruim, imagem_ruim_comprimida_c, "Cenário C - Imagem com Padrão Complexo [Colunas]");

imagem_ruim_comprimida_l = rle_binary(imagem_ruim, 1);
relatorio_desempenho(imagem_ruim, imagem_ruim_comprimida_l, "Cenário C - Imagem com Padrão Complexo [Linhas]");

subplot(5, 3, 7), imshow(imagem_ruim), title("Imagem com Padrão Complexo Original (Cenário C)");
subplot(5, 3, 8), imshow(decode_rle_binary(imagem_ruim_comprimida_c, size(imagem_ruim, 1), size(imagem_ruim, 2))'), title("Imagem com Padrão Complexo Comprimida por Colunas (Cenário C)");
subplot(5, 3, 9), imshow(decode_rle_binary(imagem_ruim_comprimida_l, size(imagem_ruim, 2), size(imagem_ruim, 1))), title("Imagem com Padrão Complexo Comprimida por Linhas (Cenário C)");

% Cenário D - Imagem com Gradiente Suave
[X,Y] = meshgrid(1:20, 1:20);
imagem_cinza = uint8(sin(X/3) .* cos(Y/3) * 127 + 128);

imagem_cinza_comprimida_c = rle_gray(imagem_cinza, 0);
relatorio_desempenho(imagem_cinza, imagem_cinza_comprimida_c, "Cenário D - Imagem com Gradiente Suave [Colunas]");

imagem_cinza_comprimida_l = rle_gray(imagem_cinza, 1);
relatorio_desempenho(imagem_cinza, imagem_cinza_comprimida_l, "Cenário D - Imagem com Gradiente Suave [Linhas]");

subplot(5, 3, 10), imshow(imagem_cinza), title("Imagem com Gradiente Suave(Cenário D)");
subplot(5, 3, 11), imshow(decode_rle_gray(imagem_cinza_comprimida_c, 20, 20)'), title("Imagem com Gradiente Suave Comprimida por Colunas (Cenário D)");
subplot(5, 3, 12), imshow(decode_rle_gray(imagem_cinza_comprimida_l, 20, 20)), title("Imagem com Gradiente Suave Comprimida por Linhas (Cenário D)");

% Cenário E - Imagem Área Uniforme
imagem_boa = uint8(zeros(20,20));
imagem_boa(1:10, 1:10) = 100; % Área uniforme
imagem_boa(1:10, 11:20) = 150; % Área uniforme
imagem_boa(11:20, 1:10) = 200; % Área uniforme
imagem_boa(11:20, 11:20) = 50; % Área uniforme

imagem_boa_comprimida_c = rle_gray(imagem_boa, 0);
relatorio_desempenho(imagem_boa, imagem_boa_comprimida_c, "Cenário E - Imagem Área Uniforme [Colunas]");

imagem_boa_comprimida_l = rle_gray(imagem_boa, 1);
relatorio_desempenho(imagem_boa, imagem_boa_comprimida_l, "Cenário E - Imagem Área Uniforme [Linhas]");

subplot(5, 3, 13), imshow(imagem_boa), title("Imagem Área Uniforme (Cenário E)");
subplot(5, 3, 14), imshow(decode_rle_gray(imagem_boa_comprimida_c, 20, 20)'), title("Imagem Área Uniforme Comprimida por Colunas (Cenário E)");
subplot(5, 3, 15), imshow(decode_rle_gray(imagem_boa_comprimida_l, 20, 20)), title("Imagem Área Uniforme Comprimida por Linhas (Cenário E)");
