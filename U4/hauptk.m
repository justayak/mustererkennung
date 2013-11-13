function [x] = hauptk( matrix )
%HAUPTK Gibt die Hauptkomponente einer Matrix zurück
%   Erwartet eine Matrix die zeilenweise die Punkte einer mehrdimensionalen
%   Punktwolke beinhaltet.

    a = var(matrix);
    ursprungsmatrix = matrix;
    sze = size(matrix);
    
    %Erwartungswert berechnen
    erwartungswert = zeros(1,16);
    for i = 1:sze(1)
        erwartungswert = erwartungswert + matrix(i,:);
    end
    erwartungswert = erwartungswert / sze(1);
    
    for i = 1:sze(1)
        ursprungsmatrix(i,:) = ursprungsmatrix(i,:) - erwartungswert;
    end
    
    comatrix = cov(ursprungsmatrix);
    [vec, val] = eig(comatrix);
    
    high = -9999999;
   	for i = 1:16
        zeilespalte = 0;
        if val(i,i) >= high
            high = val(i,i);
            zeilespalte = i;
        end
    end
    
    x = vec(:,zeilespalte);     
end

