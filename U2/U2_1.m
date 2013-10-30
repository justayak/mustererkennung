close all;
clear all;
clc;

disp('Starte Berechnung 2')
data = dlmread('points.txt');
a = buildnodes(data)                            % buildnodes erstellt den Baum
disp('Berechnung beendet')

%figure;
%hold on
%plot(data(1:end,1), data(1:end,2), '*');
%v = var(data,0,1);
%w = std(data);
%plot(v, 'r*');
%plot(w, 'g*');

disp('Beginne suche.')
[value, anz] = searchnodes( [0.2,0.3] ,  a);    % searchnodes durchsucht den Baum.

sprintf ('Der nächste Punkt zu 0.2/0.3 ist %f/%f', value(1), value(2))
sprintf ('Kontrolllösung:');
disp(checksearch( [0.2,0.3] , data));

[value, anz] = searchnodes( [0.5,0.5] ,  a);    % searchnodes durchsucht den Baum.
sprintf ('Der nächste Punkt zu 0.5/0.5 ist %f/%f', value(1), value(2))
sprintf ('Kontrolllösung:');
disp(checksearch( [0.5,0.5] , data));

[value, anz] = searchnodes( [0.9,0.3] ,  a);    % searchnodes durchsucht den Baum.
sprintf ('Der nächste Punkt zu 0.9/0.3 ist %f/%f', value(1), value(2))
sprintf ('Kontrolllösung:'); 
disp(checksearch( [0.9,0.3] , data));

disp('Ready')