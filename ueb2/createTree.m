function createTree(M, Tree)
    s = size(M,1);
    if (mod(s,2)==0)
       M = [M;[1.0,1.0]]; 
    end
    x = M(:,1);   
    y = M(:,2);
     if(var(x) < var(y))
        m = median(x);
        index = find(ismember(x,m));
     else
         m = median(y);
        index = find(ismember(y,m));
     end
     
     point = Node;
     point.
     
end