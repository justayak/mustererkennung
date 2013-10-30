function node = buildTree3(data)  
node.parent = [];
    V = var(data);
    sze = size(data)
    
    if (sze > 1)
        if ( V(1) > V(2) )
            sortrows(data, 1); %Data, column
            divide = floor (sze(1) / 2);
            node.value = data(divide,:);
            left = data(1:divide, :);
            right = data( (divide+1):end, :);

            node.dim = 'x';

            node.left = buildTree2(left, node);
            node.right = buildTree2(right, node);

        else
            sortrows(data, 2);  % Nach Y sortieren

            divide = floor(sze(1) / 2);
            node.value = data(divide,:)
            
            left = data(1:divide, :)
            right = data( (divide+1):end, :)

            node.dim = 'y';

            node.left = buildTree2(left, node);
            node.right = buildTree2(right, node);
        end
    else
        return
    end
end

function node = buildTree4(data, x)  
    node.parent = x;
    V = var(data);
    sze = size(data)
    
    if (sze > 2)
        if ( V(1) > V(2) )
            sortrows(data, 1); %Data, column
            divide = floor (sze(1) / 2);
            node.value = data(divide,:);
            left = data(1:divide, :);
            right = data( (divide+1):end, :);

            node.dim = 'x';

            node.left = buildTree2(left, node);
            node.right = buildTree2(right, node);

        else
            sortrows(data, 2);  % Nach Y sortieren

            divide = floor(sze(1) / 2);
            node.value = data(divide,:);
            left = data(1:divide, :);
            right = data( (divide+1):end, :);

            node.dim = 'y';

            node.left = buildTree2(left, node);
            node.right = buildTree2(right, node);
        end
    elseif (sze == 2)
            node.left = data(1,:);
            node.right = data(2,:); 
    elseif (sze == 1)
           node.left = data(1,:); 
    end
end

function node = buildNodes( data )
%BUILD Erstellt rekursiv einen Baum, nach nach Varianz.
%   Erstellt rekursiv einen Baum, nach nach Varianz. Ausgabe ist eine 
%   Matrix. Eingabe der Rohdaten (Zeilenweise Angaben). Für genauere 
%   Angaben bitte die Kommentare im Quelltext beachten.

    sze = size(data);           % sze ist Zeilen mal Spalten
    
    if (sze <= 2)
        return
    end
    
    %matrix = zeros(sze, 3);     % Erstellt eine Matrix mit der Größe 3 x sze
    v = var(data);            % Berechnet automatisch die Varianz

    if ( v(1) >= v(2) )
        sortrows(data, 1);
        node.dim(1, 3) = 1;    % wenn 1 dann nach x geteilt
    else 
        sortrows(data, 2);
        node.dim(1, 3) = 1;    % wenn 1 dann nach y geteilt
    end

    mid = floor(sze/2);
    disp(mid);
    node.valX = data(mid(1),1);
    node.valY = data(mid(1),2);
    
    left = data(1:mid(1)-1, :);
    right = data(mid(1)+1:end, :);
    
    node.left = next(left, 2);
    node.right = next(right, 3);
end

function nextnode = nextNodes( data )

    sze = size(data);
    
    disp(sze);
    
    if (sze(1) > 2)
        v = var(data);

        mid = floor(sze/2);

        if ( v(1) >= v(2) )
            sortrows(data, 1);
            nextnode.dim = 1;    % wenn 1 dann nach x geteilt
        else 
            sortrows(data, 2);
            nextnode.dim = 2;    % wenn 2 dann nach y geteilt
        end

        nextnode.valX = data(mid(1), 1);
        nextnode.valX = data(mid(1), 2);
        
        left = data(1:mid(1)-1, :);
        right = data(mid(1)+1:end, :);
        
        nextnode.left = next(left);
        nextnode.right = next(right);
        
        return;
        
    elseif (sze(1) == 2)
        disp ('sze == 2');
        v = var(data);
        if ( v(1) >= v(2) )
            sortrows(data, 1);
            nextnode.dim = 1;    % wenn 1 dann nach x geteilt
        else 
            sortrows(data, 2);
            nextnode.dim(n, 3) = 2;    % wenn 2 dann nach y geteilt
        end
        
        nextnode.valX = data(1, 1);
        nextnode.valX = data(1, 2);
        nextnode.left = lastnode(data(2,:));
        nextnode.right = 0;
        return;
        
    elseif (sze(1) == 1)
        disp ('sze == 1');
        nextnode.valX = data(1, 1);
        nextnode.valX = data(1, 2);
        nextnode.dim = 0;
        nextnode.left = 0;
        nextnode.right = 0;
        return;
    elseif (sze(1) == 0)
        disp('size == 0');
    end
end 



