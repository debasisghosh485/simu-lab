function []=assign()
clc

matr = [ 120 100 80; 80 90 110; 110 140 120]
min=intmax();
cost=0;
level=1;
[rows,cols]= size(matr);
job=zeros(rows,1);
minjob=job;

[cost,job]=allo(matr,cost,min,job,minjob,1);

i=1;
    
while(i<=rows)
    j=1;
    c=1;
    while(j<=cols && c==1)
        
        if(job(i,1)==matr(i,j))
            
            s=[num2str(i),' -> ',num2str(j)];
            disp(s)
                       
        end
            
        
            j=j+1;
    end
    i=i+1;
end
disp('           ');
s=[' Total Cost is ', num2str(cost)];
disp(s)





end


function [min,minjob]=allo(matr,cost,min,job,minjob,level)

[rows,cols]= size(matr);

if (rows==cols && rows==1)
    cost=cost+matr(1,1);
    job(level,1)=matr(1,1);
    
    
    if (cost<min)
        min=cost;
        minjob=job;
    end
    
    return;
end

orcost=cost;

i=1;

while (i<=cols)
    cost=orcost;
    
    cost=cost+matr(1,i);
    job(level,1)=matr(1,i);
       
    
    
    dup=matr;
    dup(1,:)=[];
    dup(:,i)=[];
    
        
    [min,minjob]=allo(dup,cost,min,job,minjob,level+1);
    
    i=i+1;
    
end
    
    

end
