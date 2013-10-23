clear all
close all
clc

fileID = fopen('pendigits-testing.txt');
data = textscan(fileID, '%d');
fclose(fileID);


matrix = data{1,1};                         % Cell-Format in Matrix
a = size(matrix);                           % Anzahl der Zeilen berechnen
matrix2 = reshape(matrix, 17, (a(1)/17));   % matrix neu formatieren... a 



%zahlen = [0 : 9];                           % Liste der zu zeichnenden Zahlen

%big = size(matrix2)

%for n = 1:big(2)
%   nummer = matrix2(17, n);                 % Reihe, Spalte
%   if any(zahlen == nummer)
%       zahlen = zahlen~=nummer              % liste der zahlen = liste ohne diese nummer
%       figure                               %zeichne
%       hold on;
%       for i = 1:15           
%           plot(matrix2(1,i), matrix2(2,i+1), 'black')
%           plot(10, 50)
%       end      
%   end
%end

for i = 0:9
    
    n = find (matrix2(end,:) == i,1)
    vektor = matrix2(1:16, n)
    
    vektorx = vektor(1:2:end, 1)
    vektory = vektor(2:2:end, 1)
   
    subplot(2,5, i+1)
    plot(vektorx, vektory)
    
end    
    
   
