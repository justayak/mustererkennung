clear all
close all
clc

data = dlmread('pendigits-training.txt');

for i = 0:9
    
    n = find (data(:,end) == i,1)
    vektor = data(n, 1:16)
    vektorx = vektor(1, 1:2:end)
    vektory = vektor(1, 2:2:end)
    
   
    subplot(2,5, i+1)
    plot(vektorx, vektory)
    
end    
    
   
