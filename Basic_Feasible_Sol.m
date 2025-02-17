%Find all Basic feasible solutions for the LPP
%Max z=3x1+4X2+0X3+0X4
%1x1+1x2<=450, or 1x1+1x2+1x3+0x4=450
%2x1+1x2<=600 or 2x1+1x2+0x3+1x4=600
% x1>=0, x2>=0

clc
clear all
format short
A=[1 1 1 0; 2 1 0 1] % write in standard form
C=[3 4 0 0]
b=[450; 600]
n=size(A,2) % column in A matrix or no. of variables
m=size(A,1) % rows in A matrix or constraints
if(n>m)
nCm=nchoosek(n,m) %nchoosek command for n choose k (or binomial coeff)
pair=nchoosek(1:n,m) % all possible cases (x1&x2;x1&x3;and so on)
sol=[];
   for i=1:nCm
    y=zeros(n,1)% n-no of variables, initialize with all var(s)=0
    x=A(:,pair(i,:))\b %pair(i,:)ith row , including all columns
    if all(x>=0 & x~=inf & x~=-inf)
    y(pair(i,:))=x
    sol=[sol, y]
   end
  end
else
    error('nCm does not exists')
end
Z=C*sol
[Zmax, Zindex]=max(Z)
bfs=sol(:,Zindex)
optimal_value=[bfs' Zmax]
optimal_bfs=array2table(optimal_value)
optimal_bfs.Properties.VariableNames(1:size(optimal_bfs,2))={'x_1','x_2','x_3','x_4','Z'}



