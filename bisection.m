clc;
clear;
f = @(x) x-cos(x);
a = 0;
b =2;
m = (a+b)/2;
tol =0.001;
error = abs(b-a);
count = 0;
if f(a)*f(b)>0
    fprintf("invalid range");
else
while error>tol
    if f(a)*f(m)<0
        b = m;
    else
        a = m;
    end
    error = abs(b-a);
    m = (a+b)/2;
    count = count+1;
end
fprintf("the root is %.3f and number of iterations are %d",m,count);
end
