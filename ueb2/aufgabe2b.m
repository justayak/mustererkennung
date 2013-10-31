clear;
V = dlmread('values-testing.txt');
T = dlmread('values-training.txt');

TS = zeros(size(T));
[b,ix] = sort(T(:,end));
TS = T(ix,:);

One = [];
Zero = [];

Confusion = zeros(2,2);

for i=1:size(V,1)
   
%     Es ist schon spät.. darum kommt hier eine naive impl. mit 
%     simpler devide-and-conquer-search
    
   search = [V(i,1), V(i,2)];
   found = [];
   ci = round(size(TS,1) / 2);
   D = TS;
   while(ci > 0)       
       if size(D,1) == 1
           found = [D(1,1),D(1,2)];
           ci=0;
           break;
       end       
       if size(D,1) < 4
          best = 999999999;
          for j = 1:size(D,1)
              v = abs(D(j,1)-search(1));
              if v < best
                 best = v;
                 found = [D(j,1), D(j,2)];
              end
          end
       end       
       if D(ci,1) == search(1)
          found = [D(ci,1), D(ci,2)];
          ci = 0;
      else
          if D(ci,1) > search(1)
              D=D(1:ci-1,1:end);
          else
              D=D(ci+1:end,1:end);              
          end
          ci = round(size(D,1) / 2);
      end
   end
   
   if found(2) == 1
       One = [One; [search(1), search(2)]];
       if search(2) == 1
           Confusion(2,2) = Confusion(2,2) + 1;
       else
           Confusion(1,2) = Confusion(1,2) + 1;
       end
   else
       Zero = [Zero; [search(1), search(2)]];
       if search(2) == 0
           Confusion(1,1) = Confusion(1,1) + 1;
       else
           Confusion(2,1) = Confusion(2,1) + 1;
       end
   end   
end

total = size(V,1);
hits = Confusion(1,1) + Confusion(2,2);
result = hits / total;

sprintf('Die Trefferquote liegt bei %f', result)

% Confusionmatrix:
% |      0      1|
% |--------------|  0 als 0 erkannt: 9993
% |0| 9993 |    7|  1 als 1 erkannt: 4320
% |1|  680 | 4320|  0 als 1 erkannt: 680
% |--------------|  1 als 0 erkannt: 7

% Die Trefferquote liegt bei 0.954200
