function [matrix] = tree( data );
    sze = size(data);
    v = var(data);
    treematrix = zeros(sze(1), 6); % (ValueX, ValueY, Dimension (1=x, 2=y), Parent, Left, Right) 
    
    if (sze >= 2)
        if (v(1) > v(2))        % Dimension = X
           X = sortrows(data, 1);
           half = floor(sze/2)
           treematrix(1,1) = X(half(1),1);
           treematrix(1,2) = X(half(1),2);
           treematrix(1,3) = 1;
           treematrix(1,4) = 0;
           treematrix(1,5) = 2;
           treematrix(1,6) = 3;
           X(half,:) = [];
          
        elseif (v(1) <= v(2))        % Dimension = X
           X = sortrows(data, 2);
           half = floor(sze/2)
           treematrix(1,1) = X(half(1),1);
           treematrix(1,2) = X(half(1),2);
           treematrix(1,3) = 2;
           treematrix(1,4) = 0;
           treematrix(1,5) = 2;
           treematrix(1,6) = 3;
           X(half,:) = [];
        end
    end
    
    matrix = treematrix;

end

function [matrix2] = branch(treematrix, count, data)
    
    sze = size(data);
    v = var(data);
    
    if (v(1) > v(2))        % Dimension = X
       X = sortrows(data, 1);
       half = floor(sze/2);
       treematrix(1,1:end) = [ X(half,1), X(half,2), 1, 0, 1, 2 ];
       X(half,:) = [];
          
    elseif (v(1) <= v(2))        % Dimension = X
       X = sortrows(data, 2);
       half = floor(sze/2);
       treematrix(1,1:end) = [ X(half,1), X(half,2), 2, 0, 1, 2 ];
       X(half,:) = [];
    end
        
    matrix = treematrix;

end