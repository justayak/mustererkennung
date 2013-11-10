function aufgabe1()
    TR = dlmread('pendigits-training.txt');
    zeros = [];
    ones = [];
    
    for i=1:size(TR,1)
        switch TR(i,17)
            case 0
                zeros = [zeros; TR(i,1:16)];
            case 1
                ones = [ones; TR(i,1:16)];
        end
    end
    
    
    cov0 = cov(zeros');
    cov1 = cov(ones');
    
    mu1 = mean(zeros');
    mu2 = mean(ones')
    
end 

