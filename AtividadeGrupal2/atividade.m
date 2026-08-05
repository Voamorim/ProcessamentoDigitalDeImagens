cd(".")
pkg load image

im1 = {imread("medicas/1.jpg")};
im2 = {imread("medicas/2.jpg")};
im3 = {imread("medicas/3.png")};
im4 = {imread("medicas/4.png")};
im5 = {imread("medicas/5.jpg")};

sobel = fspecial('sobel');
laplaciano = [0 1 0; 1 -4 1; 0 1 0];

filtros = {sobel, laplaciano}; 

media_filter = ones([3 3])/9;

results = [[im1], [im2], [im3], [im4], [im5]];

for k = 1:5
    for i = 1:2
        for j = 1:2
            bordas_filter = filtros{j};

            if i == 1 
                imagem_original = results{k}{1};
                results{k}{end+1} = filter2(media_filter, imagem_original);
                results{k}{end} = results{k}{end} + 0.5 * filter2(bordas_filter, results{k}{end});
            end

            if i == 2 
                imagem_original = results{k}{1};
                results{k}{end + 1} = medfilt2(imagem_original, [3, 3]);
                results{k}{end} = results{k}{end} + 0.5 * filter2(bordas_filter, results{k}{end});
            end
        end
    end
end

names = {"Original", "Média + Sobel", "Média + Laplaciano", "Mediana + Sobel", "Mediana + Laplaciano"};

for k = 1:5
    figure;
    for i = 1:5
        subplot(3, 2, i), imshow(results{k}{i}, []), title(names{i});
    end
end
