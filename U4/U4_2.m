clc
clear all
close all

data = dlmread('pendigits-training.txt');
sze = size(data);

% Der folgende Teil erstellt für jede Ziffer eine eigene Matrix.
null = [];
eins = [];
zwei = [];
drei = [];
vier = [];
fuenf= [];
sechs= [];
sieben=[];
acht = [];
neun = [];

for i = 1:sze(1)
    switch data(i,17)
        case 0
            null = [null, data(i,1:16)];
        case 1
            eins = [eins; data(i,1:16)];
        case 2
            zwei = [zwei; data(i,1:16)];
        case 3
            drei = [drei; data(i,1:16)];
        case 4
            vier = [vier; data(i,1:16)];
        case 5
            fuenf = [fuenf; data(i,1:16)];
        case 6
            sechs = [sechs; data(i,1:16)];
        case 7
            sieben = [sieben; data(i,1:16)];
        case 8
            acht = [acht; data(i,1:16)];
        case 9
            neun = [neun; data(i,1:16)];
    end
end 

% Jetzt liegen die Daten zur Verarbeitung vor.       

%x0 = hauptk(null);
x1 = hauptk(eins);
x2 = hauptk(zwei);
x3 = hauptk(drei);
x4 = hauptk(vier);
x5 = hauptk(fuenf);
x6 = hauptk(sechs);
x7 = hauptk(sieben);
x8 = hauptk(acht);
x9 = hauptk(neun);


figure
hold on
for i = 1:100
    plot( eins(i,1), eins(i,2));
end






