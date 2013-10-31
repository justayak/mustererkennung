
clear;
%stuff
V = dlmread('values-testing.txt');
T = dlmread('values-training.txt');

TS = zeros(size(T));
[b,ix] = sort(T(:,end));
TS = T(ix,:);

One = [];
Zero = [];

for i=1:size(V,1)
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
   else
       Zero = [Zero; [search(1), search(2)]];
   end   
end

