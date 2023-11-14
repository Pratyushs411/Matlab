format short
clear all
clc
%initialize a function
f = @(x,y) x.*(y.^(1/3));
% Input the parameters
x = input('Enter initial value of x: ');
y = input('Enter initial value of y(x): ');
h = input('Enter step size: ');
X = input('Enter x at which y is required: ');
while X-x>= -1e-10
    fprintf('value of y at x = %0.2f is %f \n' ,x,y);
    k1 = h.*f(x,y); %compute k1
    k2 = h.*f(x+h/2,y+k1/2); %compute k2
    k3 = h.*f(x+h/2,y+k2/2); %compute k3
    k4 = h.*f(x+h,y+k3); %compute k4
    k = (k1 + 2.*k2 + 2.*k3 + k4)./6; %compute k
    x = x+h; %update x
    y = y+k; %update y
end
