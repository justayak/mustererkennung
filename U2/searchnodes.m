function [value, anz] = searchnodes(point, node)
    
    fprintf('1  ')

    % Initialisierung der Variablen:
    anz = 1;
    nn.dist = pdist( [point(1), point(2); node.valX, node.valY] ,'euclidean');
    nn.point = [node.valX, node.valY];
    
    if (node.dim == 1)                  % nach x unterteilt                                      
        if (point(1) < node.valX)       % wenn x kleiner als knoten(x)
            [nn, anz] = searchrec (point, node.left, anz+1, nn); 
            if (nn.dist > pdist( [nn.point(1), nn.point(2); node.valX, nn.point(2)], 'euclidean')) 
                [nn, anz] = searchrec(point, node.right, anz+1, nn); 
            end
        else
            [nn, anz] = searchrec (point, node.right, anz+1, nn);
            if (nn.dist >= pdist( [nn.point(1), nn.point(2); node.valX, nn.point(2)], 'euclidean'))
                [nn, anz] = searchrec(point, node.left, anz+1, nn); 
            end
        end 
    elseif (node.dim == 2)  % nach y unterteilt
        if (point(2) < node.valY)
            [nn, anz] = searchrec (point, node.left, anz+1, nn);
            if (nn.dist >= pdist( [nn.point(1), nn.point(2); nn.point(1), node.valY], 'euclidean'))
                [nn, anz] = searchrec(point, node.right, anz+1, nn); 
            end
        else
            [nn, anz] = searchrec (point, node.right, anz+1, nn);
            if (nn.dist >= pdist( [nn.point(1), nn.point(2); nn.point(1), node.valY], 'euclidean'))             
                [nn, anz] = searchrec(point, node.left, anz+1, nn); 
            end
        end
    end
    
    
    
    value = nn.point;
end

function [value, anz2] = searchrec( point, node , anz, nn)
    
    fprintf ('%d  ', anz);

    if (nn.dist > pdist( [point(1), point(2); node.valX, node.valY] ,'euclidean'))
        nn.dist = pdist( [point(1), point(2); node.valX, node.valY] ,'euclidean');
        nn.point = [node.valX, node.valY];
        value = nn;
    end

    if ( (node.left.exists ~= 0) && (node.right.exists ~= 0) )              % Wenn es einen rechten und linken Unterknoten gibt, dann...
        if (node.dim == 1)     
            if (point(1) < node.valX)  
                [nn, anz] = searchrec (point, node.left, anz+1, nn);
                if (nn.dist > pdist( [nn.point(1), nn.point(2); node.valX, nn.point(2)], 'euclidean'))                
                    [nn, anz] = searchrec(point, node.right, anz+1, nn); 
                end
            else
                [nn, anz] = searchrec (point, node.right, anz+1, nn);  
                if (nn.dist > pdist( [nn.point(1), nn.point(2); node.valX, nn.point(2)], 'euclidean'))                
                    [nn, anz] = searchrec(point, node.left, anz+1, nn); 
                end
            end
        elseif (node.dim == 2)
            if (point(2) < node.valY) 
                [nn, anz] = searchrec (point, node.left, anz+1, nn); 
                if (nn.dist > pdist( [nn.point(1), nn.point(2); nn.point(1), node.valY], 'euclidean'))
                    [nn, anz] = searchrec(point, node.right, anz+1, nn); 
                end
            else
                [nn, anz] = searchrec (point, node.right, anz+1, nn);
                if (nn.dist > pdist( [nn.point(1), nn.point(2); nn.point(1), node.valY], 'euclidean'))
                    [nn, anz] = searchrec(point, node.left, anz+1, nn); 
                end
            end
        end
        anz2 = anz;
        value = nn;
    elseif (node.left.exists ~= 0)  % Wenn es nur einen linken Knoten gibt...
        [value, anz2] = searchrec (point, node.left, anz+1, nn);
        
    elseif (node.right.exists ~=0)  % Wenn es nur einen rechten Knoten gibt...
        [value, anz2] = searchrec (point, node.right, anz+1, nn);
    else
        anz2 = anz;
        value = nn;
    end  
end