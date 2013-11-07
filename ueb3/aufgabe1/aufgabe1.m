function [] = aufgabe1()
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
    cov0 = covJ(n0);
    cov1 = covJ(n1);
    cov2 = covJ(n2);
    cov3 = covJ(n3);
    cov4 = covJ(n4);
    cov5 = covJ(n5);
    cov6 = covJ(n6);
    cov7 = covJ(n7);
    cov8 = covJ(n8);
    cov9 = covJ(n9);
    
    % auf Testwerte anwenden
    Te = dlmread('pendigits-testing.txt');
    
    norm0 = [];
    norm1 = [];
    norm2 = [];
    norm3 = [];
    norm4 = [];
    norm5 = [];
    norm6 = [];
    norm7 = [];
    norm8 = [];
    norm9 = [];
    
    Confusion = zeros(10);
    
    for i=1:size(Te,1)
        norm0(i)=mvNormverteilung(cov0,n0,Te(i,1:16)');
        norm1(i)=mvNormverteilung(cov1,n1,Te(i,1:16)');
        norm2(i)=mvNormverteilung(cov2,n2,Te(i,1:16)');
        norm3(i)=mvNormverteilung(cov3,n3,Te(i,1:16)');
        norm4(i)=mvNormverteilung(cov4,n4,Te(i,1:16)');
        norm5(i)=mvNormverteilung(cov5,n5,Te(i,1:16)');
        norm6(i)=mvNormverteilung(cov6,n6,Te(i,1:16)');
        norm7(i)=mvNormverteilung(cov7,n7,Te(i,1:16)');
        norm8(i)=mvNormverteilung(cov8,n8,Te(i,1:16)');
        norm9(i)=mvNormverteilung(cov9,n9,Te(i,1:16)');
        
        all = [norm0(i),norm1(i),norm2(i),norm3(i),norm4(i),norm5(i),norm6(i),norm7(i),norm8(i),norm9(i)];
        actual = Te(i,17);
        Confusion = putToConf(Confusion,0,norm0(i),all, actual);
        Confusion = putToConf(Confusion,1,norm1(i),all, actual);
        Confusion = putToConf(Confusion,2,norm2(i),all, actual);
        Confusion = putToConf(Confusion,3,norm3(i),all, actual);
        Confusion = putToConf(Confusion,4,norm4(i),all, actual);
        Confusion = putToConf(Confusion,5,norm5(i),all, actual);
        Confusion = putToConf(Confusion,6,norm6(i),all, actual);
        Confusion = putToConf(Confusion,7,norm7(i),all, actual);
        Confusion = putToConf(Confusion,8,norm8(i),all, actual);
        Confusion = putToConf(Confusion,9,norm9(i),all, actual);
        
    end
    
    hitrate = trace(Confusion) / sum(Confusion(:))

%     Confusion-Matrix:
%     341     0     0     0     0     0     0     0    22     0
%      0   350    12     0     1     0     0     0     1     0
%      0     8   355     0     0     0     0     1     0     0
%      0     9     0   320     0     1     0     1     0     5
%      0     0     0     0   362     0     0     0     0     2
%      0     0     0     1     0   323     0     0     2     9
%      0     0     0     0     0     0   325     0    11     0
%      0    28     0     0     0     0     0   314     5    17
%      0     0     0     0     0     0     0     0   336     0
%      0     5     0     0     0     0     0     1     1   329
% 
% hitrate = 0.9591
    
end

function Confusion = putToConf(Confusion, expected, class, all, actual)
    pos = expected + 1;
    if class ~= 0 && class == max(all)
        if actual == expected
            Confusion(pos,pos) =Confusion(pos,pos) +  1;
        else
            Confusion((actual+1),pos) =Confusion((actual+1),pos) +  1;
        end
    end

end

function [result] = mvNormverteilung(covMatrix, list,X)

    mu = mean(list)';
    absSigma = det(covMatrix);
    icovar = inv(covMatrix);
    
    xmu = X-mu;
    transpo = xmu';
    a = transpo * icovar;
    expo = (-(1/2)) * a * xmu;
    
    first = (1 / ((2*pi).^(16/2) * sqrt(absSigma)));
    second = exp(1).^(expo);
    result =  first * second;
    

end

function [result] = covJ (list)
    m = repmat(mean(list),size(list,1),1);
    result =(((list-m)')*(list-m))/size(list,1);

    % nach 0 suchen und mit 0.001 ersetzen
    for i=1:16
       for j=1:16
           if result(i,j) == 0
            result(i,j) = 0.001;
           end
       end
    end
end