clc;
clear;
f = @(x) x-cos(x);
x0 = input("enter first point:");
x1 = input("enter second point:");
tol = 0.000001;
error = abs(x1-x0);
count = 0;
while error>tol
    x2 = x1 - ((x1-x0)*f(x1))/(f(x1)-f(x0));
    error = abs(x2-x1);
    x1 = x2;
    count = count+1;
end
fprintf("the root is %f and iteration are %d",x1,count);
