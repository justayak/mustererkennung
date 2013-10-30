function [value, anz] = searchtree(point, node)
    anz = 1;
    
    entf.dist = pdist( [point(1), point(2); node.valX, node.valY] ,'euclidean');
    entf.point = [node.valX, node.valY];
    
    if (node.dim == 1)                                      
        if (point(1) > node.valX)
            [entf.point, anz] = searchrec (point, node.left, anz+1, entf);
            if (entf.dist > pdist( [entf.point(1), entf.point(2); node.valX, node.valY], 'euclidean'))
                disp('Hello');
                [entf, anz] = searchrec(point, node.right, anz+1, entf); 
            end
        else
            [entf.point, anz] = searchrec (point, node.right, anz+1, entf);
            if (entf.dist > pdist( [entf.point(1), entf.point(2); node.valX, node.valY], 'euclidean'))
                disp('Hello');
                [entf, anz] = searchrec(point, node.left, anz+1, entf); 
            end
        end
    elseif (node.dim == 2)
        if (point(2) > nodes.valY)
            [entf.point, anz] = searchrec (point, node.left, anz+1, entf);
            if (entf.dist > pdist( [entf.point(1), entf.point(2); node.valX, node.valY], 'euclidean'))
                disp('Hello');
                [entf, anz] = searchrec(point, node.right, anz+1, entf); 
            end
        else
            [entf.point, anz] = searchrec (point, node.right, anz+1, entf);
            if (entf.dist > pdist( [entf.point(1), entf.point(2); node.valX, node.valY], 'euclidean'))
                disp('Hello');
                [entf, anz] = searchrec(point, node.left, anz+1, entf); 
            end
        end
    end
    value = entf;
end

function [value, anz2] = searchrec( point, node , anz, naechster)
    
    if ( (node.left.exists ~= 0) && (node.right.exists ~= 0) )
        if (naechster.dist > pdist( [point; node.valX, node.valY] ,'euclidean'))
            naechster.dist = pdist( [point; node.valX, node.valY] ,'euclidean');
            naechster.point = [node.valX, node.valY];
        end

        if (node.dim == 1)     %sortiert nach x
            if (point(1) > node.valX)
                [value, anz2] = searchrec (point, node.left, anz+1, naechster);
                if (value.dist > pdist( [naechster.point(1), naechster.point(2); node.valX, node.valY], 'euclidean'))
                    searchrec(point, node.right, anz+1, naechster); 
                end
            else
                [value, anz2] = searchrec (point, node.right, anz+1, naechster);
                if (value.dist > pdist( [naechster.point(1), naechster.point(2); node.valX, node.valY], 'euclidean'))
                    searchrec(point, node.left, anz+1, naechster); 
                end
            end
        elseif (node.dim == 2)
            if (point(2) > node.valY)
                [value, anz2] = searchrec (point, node.left, anz+1, naechster);
                if (value.dist > pdist( [naechster.point(1), naechster.point(2); node.valX, node.valY], 'euclidean'))
                    searchrec(point, node.right, anz+1, naechster); 
                end
            else
                [value, anz2] = searchrec (point, node.right, anz+1, naechster);
                if (value.dist > pdist( [naechster.point(1), naechster.point(2); node.valX, node.valY], 'euclidean'))
                    searchrec(point, node.left, anz+1, naechster); 
                end
            end
        else
            anz2 = anz;
            value = naechster;
        end
    elseif (node.left.exists ~= 0)
        
        [value, anz2] = searchrec (point, node.left, anz+1, naechster);
    elseif (node.right.exists ~=0)
        [value, anz2] = searchrec (point, node.right, anz+1, naechster);
    else
        anz2 = anz;
        value = naechster;
    end
    
end