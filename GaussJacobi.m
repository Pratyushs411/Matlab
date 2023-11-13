format short
clear all
clc
a = [27 6 -1;6 15 2;1 1 54];
b = [85;72;110];
tol = 1e-5;
x = zeros(1,size(a,1));
n = size(a,1);
error = Inf;
itr = 0;
while error>tol
    xOld = x; %preserve old value
    for i = 1:n
        sum = 0; %initilize sum
        for j = 1:n
            if j~=i   %leave tie ith variable
                sum = sum+a(i,j)*xOld(j);  %compute total
            end
        end
        x(i) = (1/a(i,i))*(b(i)-sum); %jacobi method updation
    end
    itr = itr+1; %update iterations
    error = abs(xOld-x); %update error
end
x
fprintf('no of iterations are %d',itr)
