format short
clear all
clc
a = [2 -1 0;-1 2 -1;0 -1 2];
x = [1;1;1];
choice1 = menu('pick the choice','largest','smallest','near to...');
if choice1==1
    b = a;
elseif choice1==2
    b = inv(a);
else
    lam0 = input('enter value: ');
    d = a-lam0.*eye(size(a));
    b = inv(d);
end
itr = 1;
tol = 1e-2;
error = 10000;
lam1 = Inf;
while error>tol
    xOld = x;
    y = b*x;
    eigVal = max(abs(y));
    eigVec = y./eigVal;
    x = eigVec;
    error = abs(sum(xOld-x));
    lam1 = eigVal;
    itr = itr+1;
end
fprintf('number of iterations = %d\n',itr-1);
if choice1==1
fprintf('the largest eigen value is %5.5f\n',lam1);
elseif choice1==2
fprintf('the smallest eigen value is %5.5f\n',1/lam1);
else 
fprintf('the nearest eigen value near %5.3f is %5.5f\n',lam0,lam0+1/lam1);
end
fprintf('corresponding eigen vector is :\n');
x
