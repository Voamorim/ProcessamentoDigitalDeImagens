% Grupo: Leonardo Guimarães de Oliveira, Murilo Martins Marques, Vitor Oliveira Amorim

cd(".")
pkg load image

function img_out = loadimage(filepath)
    img_raw = imread(filepath);
    if size(img_raw, 3) == 3
        img_out = rgb2gray(img_raw);
    else
        img_out = img_raw;
    end
    img_out = im2double(img_out);
end

function [dx, dy] = get_d(im)
    [M, N] = size(im);
    [x, y] = meshgrid(1:N, 1:M);
    dx = x - floor(N/2);
    dy = y - floor(M/2);
end


function ideal_lowpass(im, c_size)
    [dx, dy] = get_d(im);
    z = sqrt((dx).^2 + (dy).^2);
    c = (z < c_size);
    apply_filter(im, c, "Ideal Lowpass");
end


function ideal_highpass(im, c_size)
    [dx, dy] = get_d(im);
    z = sqrt((dx).^2 + (dy).^2);
    c = (z >= c_size);
    apply_filter(im, c, "Ideal Highpass");
end


function gaussian_lowpass(im, sigma)
    [dx, dy] = get_d(im);
    D2 = (dx).^2 + (dy).^2;
    c = exp(-D2/(2*sigma^2));
    apply_filter(im, c, "Gaussiano Lowpass");
end


function gaussian_highpass(im, sigma)
    [dx, dy] = get_d(im);
    D2 = (dx).^2 + (dy).^2;
    c = 1 - exp(-D2/(2*sigma^2));
    apply_filter(im, c, "Gaussiano Highpass");
end


function butterworth_lowpass(im, D0, n)
    [dx, dy] = get_d(im);
    D = sqrt((dx).^2 + (dy).^2);
    c = 1 ./ (1 + (D./D0).^(2*n));
    apply_filter(im, c, "Butterworth Lowpass");
end


function butterworth_highpass(im, D0, n)
    [dx, dy] = get_d(im);
    D = sqrt((dx).^2 + (dy).^2);
    c = 1 ./ (1 + (D0./(D + eps)).^(2*n));

    apply_filter(im, c, "Butterworth Highpass");
end


function apply_filter(im, c, name)
    F = fft2(im);
    F_shifted = fftshift(F);
    FL = F_shifted .* c;
    FL_unshift = ifftshift(FL);
    FL_inversa = ifft2(FL_unshift);
    figure;
    subplot(2,2,1), imshow(im), title("Imagem Original");
    subplot(2,2,2), imshow(mat2gray(log(1 + abs(F_shifted)))), title("Espectro");
    subplot(2,2,3), imshow(mat2gray(c)), title(name);
    subplot(2,2,4), imshow(mat2gray(abs(FL_inversa))), title("Imagem Filtrada");
end

im1 = loadimage("medicas/1.jpg");
im2 = loadimage("medicas/2.jpg");
im3 = loadimage("medicas/3.png");
im4 = loadimage("medicas/4.png");
im5 = loadimage("medicas/5.jpg");

% Imagem 1
ideal_lowpass(im1, 50);
gaussian_lowpass(im1, 20);
butterworth_lowpass(im1, 50, 2);

ideal_highpass(im1, 10);
gaussian_highpass(im1, 20);
butterworth_highpass(im1, 50, 2);

% Imagem 2
ideal_lowpass(im2, 50);
gaussian_lowpass(im2, 20);
butterworth_lowpass(im2, 50, 2);

ideal_highpass(im2, 10);
gaussian_highpass(im2, 20);
butterworth_highpass(im2, 50, 2);

% Imagem 3
ideal_lowpass(im3, 50);
gaussian_lowpass(im3, 20);
butterworth_lowpass(im3, 50, 2);

ideal_highpass(im3, 10);
gaussian_highpass(im3, 20);
butterworth_highpass(im3, 50, 2);

% Imagem 4
ideal_lowpass(im4, 50);
gaussian_lowpass(im4, 20);
butterworth_lowpass(im4, 50, 2);

ideal_highpass(im4, 10);
gaussian_highpass(im4, 20);
butterworth_highpass(im4, 50, 2);


% Imagem 5
ideal_lowpass(im5, 50);
gaussian_lowpass(im5, 20);
butterworth_lowpass(im5, 50, 2);

ideal_highpass(im5, 10);
gaussian_highpass(im5, 20);
butterworth_highpass(im5, 50, 2);
