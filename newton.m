clc;
clear;
syms x;
f = @(x) x-cos(x);
df = diff(f,x);
g = inline(df);
x0 = input("enter first point:");
tol = 0.000001;
error = abs(f(x0));
count = 0;
while error>tol
    x1 = x0 - f(x0)/g(x0);
    error = abs(f(x0));
    x0 = x1;
    count = count+1;
end
fprintf("the root is %f and iteration are %d",x1,count);
