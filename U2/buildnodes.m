function node = buildnodes( data )
%BUILD Erstellt rekursiv einen Baum, nach nach Varianz.
%   Erstellt rekursiv einen Baum, nach nach Varianz. Ausgabe ist eine 
%   Matrix. Eingabe der Rohdaten (Zeilenweise Angaben). Für genauere 
%   Angaben bitte die Kommentare im Quelltext beachten.

    sze = size(data);               % sze ist Zeilen mal Spalten
    v = var(data);                  % Berechnet automatisch die Varianz

    if ( v(1) > v(2) )
        data = sortrows(data, 1);          % sortieren nach x
        node.dim = 1;               % wenn 1 dann nach x geteilt
    else 
        data = sortrows(data, 2);          % sortieren nach y
        node.dim = 1;               % wenn 1 dann nach y geteilt
    end

    mid = floor(sze/2);             % Berechnung des Mittelwerts

    node.exists = 1;                % Hilfsvariable für die Suchfunktion
    node.valX = data(mid(1),1);     % Zuweisung der Werte für X 
    node.valY = data(mid(1),2);     % und Y
    
    left = data(1:mid(1)-1, :);     % Unterteilung der Liste in die Elemente    Links bekommt kleine Werte
    right = data(mid(1)+1:end, :);  % links und rechts von mid                  Recht bekommt große Werte
    
    %disp(left);
    %disp(right);
    
    node.left = next(left, node);   % Berechnung der Unterknoten
    node.right = next(right, node);
    return;
end

function nextnode = next( data , parent)
    
    sze = size(data);
    %disp(sze(1));
    
    nextnode.exists = 1;
    
    %nextnode.parent = parent;      % Wenn aktiv, dann hängt sich Matlab auf
    
    if (sze(1) > 2)                 % Wenn noch mehr als zwei Elemente in der Liste sind 
                                    % (dann können auch noch mehr als 2 Knoten gebildet werden).
        v = var(data);                  

        mid = floor(sze/2);

        if ( v(1) > v(2) )
            data = sortrows(data, 1);
            nextnode.dim = 1;       % wenn 1 dann nach x geteilt
        else 
            data = sortrows(data, 2);
            nextnode.dim = 2;       % wenn 2 dann nach y geteilt
        end

        nextnode.valX = data(mid(1), 1);
        nextnode.valY = data(mid(1), 2);
        
        left = data(1:mid(1)-1, :);
        right = data(mid(1)+1:end, :);
        szeL = size(left);
        szeR = size(right);
        
        if (szeL(1) > 0)
            nextnode.left = next(left, nextnode);
        else
            nextnode.left.exists = 0;
        end
        
        if (szeR(1) > 0)
            nextnode.right = next(right, nextnode);
        else
            nextnode.right.exists = 0;
        end
          
    elseif (sze(1) == 2)
        nextnode.exists = 1;
        
        %disp('Letzte Größe war 2')
        v = var(data);
        if ( v(1) >= v(2) )
            data = sortrows(data, 1);
            nextnode.dim = 1;    % wenn 1 dann nach x geteilt
        else 
            data = sortrows(data, 2);
            nextnode.dim = 2;    % wenn 2 dann nach y geteilt
        end
        
        nextnode.valX = data(1, 1);
        nextnode.valY = data(1, 2);
        nextnode.right = next(data(2,1:end), nextnode);
        nextnode.left.exists = 0;
        
    elseif (sze(1) == 1)
        nextnode.exists = 1;
        nextnode.valX = data(1, 1);
        nextnode.valY = data(1, 2);
        nextnode.dim = 0;
        nextnode.left.exists = 0;
        nextnode.right.exists = 0; 
        
    end;
    return;
end 


