V = dlmread('values-testing.txt');
T = dlmread('values-training.txt');

Zero = [];
One = [];
for i = (1:size(T,1))
    if V(i,2) == 1
        One = [One; T(i,1)];
    else
        Zero = [Zero; T(i,1)];
    end
end

varianzOne = var(One);
ExOne = mean(One);

varianzZero = var(Zero);
ExZero = mean(Zero);

% A-Priori-Wahrscheinlichkeit
aPrioriOne = size(One) / size(T,1);
aPrioriZero = size(Zero) / size(T,1);

normalOne = normpdf(T,ExOne,sqrt(varianzOne));
normalZero = normpdf(T,ExZero,sqrt(varianzZero));

% Confusion Matrix
Confusion = zeros(2,2);
for i=1:size(T,1)
    if ((normalOne(i)*aPrioriOne)<(normalZero(i)*aPrioriZero))
        Confusion(T(i,2)+1,1)=Confusion(T(i,2)+1,1)+1;
    else
        Confusion(T(i,2)+1,2)=Confusion(T(i,2)+1,2)+1;
    end
end

% Bayes-Klassifikator:
classifiedZero = [];
classifiedOne = [];

for i = (1:size(V,1))
    x = V(i,1);
    pFeatureZero = (1 / sqrt(2*pi*varianzZero)) * exp( -(x - ExZero)^2 / (2*varianzZero));
    pFeatureOne = (1 / sqrt(2*pi*varianzOne)) * exp( -(x - ExOne)^2 / (2*varianzOne));
    evidence = aPrioriZero * pFeatureZero + aPrioriOne * pFeatureOne;
    
    posteriorOne = (aPrioriOne * pFeatureOne)/evidence;
    posteriorZero = (aPrioriZero * pFeatureZero)/evidence;
    
    if posteriorOne > posteriorZero
        classifiedOne = [classifiedOne; [x, V(i,2)]];
    else
         classifiedZero = [classifiedZero; [x, V(i,2)]];
    end    
end

ClassifiedConfusion = zeros(2,2);

for i = (1:size(classifiedOne,1))
    if(classifiedOne(i,2) == 1)
        ClassifiedConfusion(2,2) = ClassifiedConfusion(2,2) + 1;
    else 
        ClassifiedConfusion(2,1) = ClassifiedConfusion(2,1) + 1;
    end
end

for i = (1:size(classifiedZero,1))
    if(classifiedZero(i,2) == 0)
        ClassifiedConfusion(1,1) = ClassifiedConfusion(1,1) + 1;
    else 
        ClassifiedConfusion(1,2) = ClassifiedConfusion(1,2) + 1;
    end
end

%final confusion matrix:
ClassifiedConfusion
