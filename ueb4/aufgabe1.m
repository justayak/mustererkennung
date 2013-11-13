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
    
    
    cov0 = cov(zeros);
    cov1 = cov(ones);
    
    mu1 = mean(zeros);
    mu2 = mean(ones);
    
    v = randn(1000,16);
    v = bsxfun(@rdivide,v,sqrt(sum(v.^2,2)));

    u = [];
    
    for i=1:1000
      
        % Abstand auf u(i) projizierten Mittelwerte
        top = (mu1 * v(i,:)' - mu2 * v(i,:)');
        top = (top * top');
        
        % Summe der auf u(i) projizierten Varianzen
        bottom = ( (v(i,:) * cov0 * v(i,:)') + (v(i,:) * cov1 * v(i,:)'));
       
        % Fisher-Kriterium
        u = [u ; (top / bottom )];
        
    end
    
    m = max(u)
    
    % m = 28.3439
end