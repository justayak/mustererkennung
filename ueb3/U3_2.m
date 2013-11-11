clc
clear all
close all

% Aufgabe 2
% a) Wir haben die Klassen 1 bis 100 von denen jede genau 10 mal getroffen
% wird.

test = zeros(1000,1);

y = 1;
v = 1;
for i = 1:100
    for j = 1:10
        test(y,1) = v;
         y = y+1;
    end
    v = v+1;
end


hgramm = hist(test,100);
subplot(1,2,1), hist(test, 100, 0:50:100, 0:2:12)

V = var(test);
E = mean(test);

ent = entropy(test);
fprintf('Varianz: %f \n', V) 
fprintf('Erwartungswert: %f \n', E)

% b) Als neuen Erwartungswert lege ich 55 fest und die Varianz soll 13 zum
% quadrat (=169)

% c) Entropie über Histogramm in Abhängigkeit zu Erwartungswert und Varianz
% berechnen.

H1 = 0;
for i = 1:100
    px = normpdf( hgramm(1,i), 55, 13);   % die wahrscheinlichkeit unter berücksichtigung von dem festgelegtem Erwartungswert und der Varianz
    H1 = H1 + (px * log2(px));
end
H1 = -H1;

fprintf('Die Entropie über dem Histogramm beträgt %f. \n', H1)
fprintf('Die Entropie(Matlab) über dem Histogramm (ohne Einfluss) beträgt %f. \n', entropy(hgramm))

H2 = 0;
for j = 1:1000
    px = normpdf( test(j,1), 55, 13);   % die wahrscheinlichkeit unter berücksichtigung von dem festgelegtem Erwartungswert und der Varianz
    H2 = H2 + (px * log2(px));
end


% d)

test2 = test;
test2(1000,1) = 50;
hgramm2 = hist(test2,100);
subplot(1,2,2), hist(test2,100, 0:50:100, 0:2:12)

H1 = 0;
for i = 1:100
    px = normpdf( hgramm2(1,i), 55, 13);   % die wahrscheinlichkeit unter berücksichtigung von dem festgelegtem Erwartungswert und der Varianz
    H1 = H1 + (px * log2(px));
end
H1 = -H1;

fprintf('Die Entropie über dem rechten Histogramm beträgt %f. \n', H1)
%fprintf('Die Varianz des rechten Histogramms beträgt %f. \n', 0)
%fprintf('Der Erwartungswert des rechten Histogramms beträgt %f. \n', 0)



