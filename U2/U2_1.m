close all;
clear all;
clc;

disp('Baum wird erstellt...')
data = dlmread('points.txt');
a = buildnodes(data);                           % buildnodes erstellt den Baum
disp('OK')

%figure;
%hold on
%plot(data(1:end,1), data(1:end,2), '*');
%v = var(data,0,1);
%w = std(data);
%plot(v, 'r*');
%plot(w, 'g*');

fprintf ('\n')

disp('Beginne suche...')

[value, anz] = searchnodes( [0.2,0.3] ,  a);    % searchnodes durchsucht den Baum.
fprintf ('\n Der nächste Punkt zu 0.2/0.3 ist (%f, %f). Besuchte Knoten %d. \n', value(1), value(2), anz)
fprintf ('Kontrolllösung: (%f, %f) \n', (checksearch( [0.2,0.3] , data)))

fprintf ('\n')

[value, anz] = searchnodes( [0.5,0.5] ,  a);    % searchnodes durchsucht den Baum.
fprintf ('\n Der nächste Punkt zu 0.5/0.5 ist (%f, %f). Besuchte Knoten %d. \n', value(1), value(2), anz) 
fprintf ('Kontrolllösung: (%f, %f) \n', (checksearch( [0.5,0.5] , data)))

fprintf ('\n')

[value, anz] = searchnodes( [0.9,0.3] ,  a);    % searchnodes durchsucht den Baum.
fprintf ('\n Der nächste Punkt zu 0.9/0.3 ist (%f, %f). Besuchte Knoten %d. \n', value(1), value(2), anz)
fprintf ('Kontrolllösung: (%f, %f) \n', (checksearch( [0.9,0.3] , data)))

disp('Fertig')