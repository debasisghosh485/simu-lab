clear all;
close all;
clc
tran = input ('Enter a matrix ');
supply = input ('Enter the supply ');
demand = input ('Enter the demand ');
%tran = [10,0,20,11;12,7,9,20;0,14,16,18;];
 z = zeros(3,4);
 %supply =[20,25,15];
 %demand =[10,15,15,20];
 
 
 
 
 
 
 i=1;
 j=1;
 cost=0;
 
 
 while ( i<4 && j<5)
    if supply(i) < demand(j)
        demand(j) = demand(j) - supply(i);
        z(i,j)= supply(i);
        cost = cost + supply(i)*tran(i,j);
        supply(i)=0;
        i=i+1;        
    else
        supply(i)=supply(i)- demand(j);
        z(i,j)=demand(j);
        cost = cost + demand(j)*tran(i,j);
        demand(j)=0;
        j=j+1;
        
    end
 end
 
 i=1;
 
 while (i<4)
    j=1;
    while(j<5)
    if z(i,j) ~= 0
        s=['x',num2str(i),num2str(j),'=',num2str(z(i,j))];
        disp(s)
    end
    j=j+1;
    end
    i=i+1;
 end
 
 s=['Allocation Matrix '];
 disp(s)
 disp(z)
 s=['Cost is ',num2str(cost)];
 disp(s)
 
 