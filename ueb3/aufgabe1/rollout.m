clear;    
Te = dlmread('pendigits-testing.txt');
Tr = dlmread('pendigits-training.txt');

n0 = [];
n1 = [];
n2 = [];
n3 = [];
n4 = [];
n5 = [];
n6 = [];
n7 = [];
n8 = [];
n9 = [];

for i=1:size(Tr,1)
    current = Tr(i,1:16);
    switch Tr(i, 17)
        case 0
            n0 = [n0; current];
        case 1
            n1 = [n1; current];
        case 2
            n2 = [n2; current];
        case 3
            n3 = [n3; current];
        case 4
            n4 = [n4; current];
        case 5
            n5 = [n5; current];
        case 6
            n6 = [n6; current];
        case 7
            n7 = [n7; current];
        case 8
            n8 = [n8; current];
        case 9
            n9 = [n9; current];            
    end
end