clear all;
close all;
clc
%tran = input ('Enter a matrix ');
%supply = input ('Enter the supply ');
%demand = input ('Enter the demand ');
tran = [10,0,20,11;12,7,9,20;0,14,16,18;];
 z = zeros(3,4);
 supply =[20,25,15];
 demand =[10,15,15,20];
 
 
 dup=tran;
 
 M=min(tran);
 mini=min(M);
 
 M=max(tran);
 maxi=max(M);
 
 k=1;
 l=1;
 cost=0;
 
 while (mini<=maxi)
     k=1;
     while(k<4)
         l=1;
           while(l<5)
                    if tran(k,l)== mini
                        dup(k,l)=maxi+1;
                        if supply(k)<=demand(l)
                            z(k,l)=supply(k);
                            cost=cost+supply(k)*tran(k,l);
                            demand(l)=demand(l)-supply(k);  
                            supply(k)=0;
                        else
                            z(k,l)=demand(l);
                            cost=cost+demand(l)*tran(k,l);
                            supply(k)=supply(k)-demand(l);
                            demand(l)=0;
                        end                       
                    end
                   l=l+1;
            end
        k=k+1;
     end
     mini=min(min(dup));
 end
 
 s=['Allocation Matrix '];
 disp(s)
 disp(z)
 s=['Cost is ',num2str(cost)];
 disp(s)