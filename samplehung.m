function []=samplehung()

clc

%matr=[26 23 27;23 22 24;24 20 23]
%matr=[120 100 80;80 90 110;110 140 120]
matr=[10 5 13 15 16;3 9 18 13 6;10 4 2 2 2;7 11 9 7 12;7 9 10 4 12]


lines=0;
[r,c]=size(matr);
dupl=matr;

rows=min(dupl');
i=1;
while(i<=r)
    j=1;
    while(j<=c)
        dupl(i,j)=dupl(i,j)-rows(i);
        j=j+1;
    end
    i=i+1;
end

cols=min(dupl);
j=1;
while(j<=c)
    i=1;
    while(i<=r)
        dupl(i,j)=dupl(i,j)-cols(j);
        i=i+1;
    end
    j=j+1;
end

dupl





while(lines<r)
    
    lines=0;
    totalzer=0;
    inst=0;
    chk=1;
    zer=0;
    br=0;

    dup=dupl;

    
    rows=zeros(1,r);
    cols=zeros(1,c);
    coldub=zeros(1,c);
    
    
    while(br==0)
        i=1;
        totalzer=0;
        inst=0;
        
        while(i<=r)
            j=1;
            zer=0;
            while(j<=c)            
                if(dup(i,j)==0)
                    zer=zer+1;
                end
                j=j+1;
            end
            j=1;
            while(j<=c)
                if(dup(i,j)==0 && chk==1 && zer==1)
                    cols(j)=1;
                    dup(:,j)=-1;
                    dup(i,j)=-2;
                    lines=lines+1;
                    inst=inst+1;
                else
                    if(dup(i,j)==0 && chk==2 && coldub(j)~=1)
                        rows(i)=1;
                        coldub(j)=1;
                        dup(i,:)=-1;
                        dup(i,j)=-2;
                        lines=lines+1;
                        inst=inst+1;      
                    end
                end
                j=j+1;
            end
                       
            i=i+1;  
        end
        i=1;
        while(i<=r)
            j=1;
            while(j<=c)
                if(dup(i,j)==0)
                    totalzer=totalzer+1;                
                end
                j=j+1;
            end
            i=i+1;
        end
        
        if(totalzer~=0 && inst==0)
            if(chk==1)
                chk=2;
            else
                chk=1;
            end
        end
                 
        if (totalzer==0)
            br=1;
        end
    end
    
       
    if(lines~=r)
        mini=intmax;
        i=1;
        while(i<=r)
            j=1;
            while(j<=c)
                if(dup(i,j)>0 && dup(i,j)<mini)
                    mini=dup(i,j);
                end
                j=j+1;
            end
            i=i+1;
        end
        
        
        
        i=1;
        while(i<=r)
            j=1;
            while(j<=c)
                if(dup(i,j)>0)
                    dupl(i,j)=dup(i,j)-mini;
                end
                
                if(rows(i)==1 && cols(j)==1)
                    dupl(i,j)=dupl(i,j)+mini;
                end
                
                j=j+1;
            end
            i=i+1;
        end     
        
    end
        
end


dup


i=1;
cost=0;
while(i<=r)
    j=1;
    while(j<=c)        
        if(dup(i,j)==-2)           
            s=['P',num2str(i),' -> J',num2str(j)];
            disp(s)  
            cost=cost+matr(i,j);
        end
        j=j+1;
    end
    i=i+1;
end

disp('           ');
s=[' Total Cost is ', num2str(cost)];
disp(s)




end
