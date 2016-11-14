clc

matr=[-5 10 20; 5 -10 -10; 5 -20 -20];

minmax=min(max(matr'));
maxmin=max(min(matr));

br=1;
dup=matr;
while (minmax~=maxmin && br~=0)
    br=0;
    
    [rows,cols]=size(dup);
    
    
    %for rows
    i=1;
    while(i<rows)
        j=1;
        while(j<=rows)
            if(dup(i,:)>=dup(j,:))
                if(j~=i)
                    dup(j,:)=[];
                    rows=rows-1;
                    br=1;
                end
            end
            j=j+1;
        end
        i=i+1;
    end
    
    
    %for cols
    i=1;
    while(i<cols)
        j=1;
        while(j<=cols)
            if(dup(:,i)<=dup(:,j))
                if(j~=i)
                    dup(:,j)=[];
                    cols=cols-1;
                    br=1;
                end
            end
            j=j+1;            
        end
        i=i+1;
    end
    
        
    minmax=min(max(dup'));
    maxmin=max(min(dup));
    
end

disp('Reduced Matrix ')
disp(dup)

%maxmin
%minmax

if(minmax==maxmin)
    disp('Saddle point with value ', num2str(minmax))
else
    disp('No Saddle point available')
end
