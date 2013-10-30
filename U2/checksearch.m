function [next] = checksearch( punkt, data )
    weight = size(data);
    next = pdist( [punkt(1,1), punkt(1,2); data(1,1), data(1,2)] ,'euclidean');
    point = [data(1,1), data(1,2)];
    for n = 2 : weight(1)
        if ( pdist( [punkt(1,1), punkt(1,2); data(n,1), data(n,2)] ,'euclidean') < next)
             next = pdist( [punkt(1,1), punkt(1,2); data(n,1), data(n,2)] ,'euclidean'); 
             point = [data(n,1), data(n,2)];
        end 
    end
    next = point;
end