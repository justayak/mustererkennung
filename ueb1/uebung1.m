M=dlmread('pendigits-training.txt');

NBR_POS = 17;

FIGURE_W = 5;
FIGURE_H = 2;

lookup=[0, false,1;1, false, 2;2, false,3;3, false,4;
    4, false,5;5, false,6;6, false,7;7, false,8;
    8, false,9;9, false,10];

count=0;

B=[1 5,2 2,4 1,5 6,2 5,1 0,2 1,4 2,0 1];

figure;

for i=1:size(M,1),
    currentNbr = M(i,NBR_POS);
    pos = currentNbr  + 1;

    if(lookup(pos,2)~=true)

        figurePos = lookup(pos,3);

        subplot(FIGURE_H,FIGURE_W,figurePos);

        title(strcat('Nbr: ', int2str(currentNbr)));

        x=[];
        y=[];
        for j=1:2:16,
           x = [x, M(i,j)];
           y = [y, M(i,j+1)];
        end

        line(x,y);

        axis([0,100,0,100]);

        lookup(pos,2)=true;
        count = count + 1;
        if count > 9
            break;
        end
    end
end