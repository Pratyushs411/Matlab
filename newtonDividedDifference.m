format short
clear all
clc
x = [0 1 2 4 5 6];
y = [1 14 15 5 6 19];
a = input('enter value:');
n = size(x,2);
DD = zeros(n,n); %nxn matrix
DD(:,1) = y'; %first column
for j = 2:n
    for i = 1:(n-j+1)
        num = DD(i+1,j-1)-DD(i,j-1);
        den = (x(i+j-1) - x(i));
        DD(i,j) = num./den;
    end
end
for i=1:size(x,2)-1
    P(i) = prod(a-x(:,1:i))*DD(1,i+1); %compute L
end
b = y(1) + sum(P);
b
