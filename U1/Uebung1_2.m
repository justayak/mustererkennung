
close all
clear all 
clc

%disp('In der Matrix Y mit n Spalten stehen die Ergebnisse in der folgenden')
%disp('Reihenfolge:')
%disp('Spalte 1 bis anz : Die ersten anz Zahlen, mit der kleinsten') 
%disp('Entfernung zum Punkt.')
%disp('Spalte n-1: Das korrekte Ergebnis zum Vergleich')
%disp('Spalte n: Das gefundene Ergebnis.')

filedata = dlmread ('pendigits-training.txt');
testdata = dlmread('pendigits-testing.txt');

A = createns(filedata(1:end, 1:end-1),'distance', 'euclidean');

sze = size(testdata);                                %Größe von Testdata

%Mit n nächsten Nachbarn:
anz = 3;                                            %Anzahl der NN

sprintf('Die Berechnung erfolgt mit %d nächsten Nachbarn. Bitte warten...', anz)

Y = ones(sze(1), anz + 2);                          %Erstellt eine Matrix mit der richtigen Größe

for n = 1 : sze(1)
    punkte = knnsearch(A, testdata(n, 1:end-1), 'k', anz);    
    for x = 1:anz
        Y(n,x) = filedata( (punkte(1, x)), end );   %Die ersten 3 Werte sind die nähesten 3 Zahlen die gefunden wurden. (Nähe)   
    end   
    Y(n,anz+1) = testdata(n, end);                  % Das erwartete (richtige) Ergebnis.  
    Y(n,anz+2) = mode( Y(n,1:anz) );                % Wählt die Zahl als gefundenes Ergebnis, die am häufigsten vorkommt.     
end

CM = zeros(10,10);
sz = size(Y);

for m = 1: sz(1)
    CM( Y(m,end)+1, Y(m,end-1)+1 ) = (CM( Y(m,end)+1 , Y(m,end-1)+1 )) + 1;
end    

treffer = trace(CM);
gesamt = sum(CM(:));
disp(CM);
ergebnis = treffer / gesamt;

sprintf('Die Trefferquote liegt bei %f Prozent.', ergebnis)


    
