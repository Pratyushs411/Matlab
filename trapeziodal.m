format short
clear all
clc
f = @(x) 1./(1+x);
a = input("enter lower limit:");
b = input("enter upper limit:");
n = input("enter no of subintervals:");
h = (b-a)/n;
i = 1:1:n-1;
s = f(a+i.*h);
out = (h./2).*(f(a) + 2.*sum(s) + f(b));
fprintf('value of intgration is %f\n',out);
