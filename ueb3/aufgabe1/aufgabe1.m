function [stuff] = aufgabe1()
    clear;        
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
    
    % Ermittle alle Kovarianz-Matrizen
    cov0 = cov(n0);
    cov1 = cov(n1);
    cov2 = cov(n2);
    cov3 = cov(n3);
    cov4 = cov(n4);
    cov5 = cov(n5);
    cov6 = cov(n6);
    cov7 = cov(n7);
    cov8 = cov(n8);
    cov9 = cov(n9);
    
    % auf Testwerte anwenden
    Te = dlmread('pendigits-testing.txt');
    
    
    stuff = mvNormverteilung(cov0, n0);
    
end

function [result] = mvNormverteilung(covMatrix, list)

    mu = mean(list)';
    X = list(6,:)';
    absSigma = det(covMatrix);
    icovar = inv(covMatrix);
    
    xmu = X-mu;
    transpo = xmu';
    a = transpo * icovar;
    expo = (-(1/2)) * a * xmu;
    
    first = (1 / ((2*pi).^(16/2) * absSigma.^(1/2)));
    second = exp(1).^(expo);
    result =  first * second;
    

end

function [result] = cov (list)
   X = list(1,:);
   result = zeros(16);
   mu = mean(list);
   %varianz = var(list);
   for i=1:16
       for j=1:16
           result(i,j) = mean((X(j)-mu(j)) * (X(i)-mu(i)));
           if result(i,j) == 0
            result(i,j) = 0.001;
           end
       end
   end

end