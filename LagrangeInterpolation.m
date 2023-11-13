format short
clear all
clc
x = [110 130 160 190];
y = [10.8 8.1 5.5 4.8];
a = input('enter value:');
for i=1:size(x,2)
    x1 = x; %save a copy
    x1(i) = []; %remove ith one
    l(i) = prod(a-x1)./prod(x(i)-x1); %compute L
end
b = sum(l.*y);
b
