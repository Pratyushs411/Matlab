format short
clear all
clc
a = [6 3 2;6 4 3;20 15 12];
b = [6;0;0];
c = [a b];
for i=1:size(c,1)
    for j=i+1:size(c,1)
        key1 = c(j,i)./c(i,i);
        c(j,:) = c(j,:) - key1.*c(i,:);
    end
end
x = zeros(1,size(a,2));
for i=size(c,1):-1:1
    hg = sum(c(i,i+1:end-1).*x(i+1:end));
    x(i)=(c(i,end)-hg)./c(i,i);
end
x
