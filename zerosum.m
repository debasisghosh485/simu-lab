clc;

matr=[-1 2 -2;6 4 -6];

[rows,cols]=size(matr);

colmax = max(matr);
rowmin = min(matr');

c=min(colmax);
r=max(rowmin);
number=0;
i=0;
while (i<rows && r==c)
    j=0;
    while (j<cols)
        if(colmax(j+1)==rowmin(i+1)&& r==colmax(j+1))
            prow=i+1;
            pcol=j+1;
			value=matr(prow,pcol);
            s=['Value of the game is ',num2str(value), ' at index (',num2str(prow),',',num2str(pcol),')'];
            disp(s)
            number=number+1;
        end
        j=j+1;
    end
    i=i+1;
end



s=['Number of saddle points is/are ',num2str(number)];
disp(s)
        


