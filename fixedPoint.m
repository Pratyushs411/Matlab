clc;
clear;
f = @(x) x-cos(x);
a = input("enter approx:");
g = @(x) cos(x);
tol = 0.00001;
x1 = g(a);
error = abs(x1-a);
count = 0;
while error>tol
    x1 = g(a);
    error = abs(x1-a);
    a = x1;
    count = count+1;
end
fprintf("the root is %f and iteration are %d",x1,count);
