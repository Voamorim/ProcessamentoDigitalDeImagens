clear all
close all
clc % Limpa a tela


X = [1 1 2 1 3; 1 1 2 3 1; 2 2 3 2 2; 1 3 2 1 1]
min_val = min(X(:)); % Pega o menor valor da matriz
max_val = max(X(:)); % Pega o maior valor da matriz
Y = (X - min_val) / (max_val - min_val)

Z = mat2gray(X)
