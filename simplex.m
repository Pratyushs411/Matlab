clc;
clear all;
A = [ 6 4 ; 1 2 ; -1 1 ; 0 1];
B = [24 ; 6 ; 1 ; 2];
C = [5 4];
constr = [1 ; 1 ; 1 ; 1];
objective = 1;
[m,nn] = size(A);
slacksurplus = 1;
E = eye(m);
 
for i = 1:m
    if constr(i) == 1
        Aug(i,:) = [A(i,:) E(slacksurplus,:)];
        slacksurplus = slacksurplus+1;
    end
end
Aug;
%%
 
Aug = [Aug B]; 
[m,n] = size(Aug); 
cost = [C zeros(1,n-nn-1)];
BV = zeros(m,1);
optima = 0;
Aug
 
%%
while(optima == 0)
    for i = 1 : n-1
        if(sum(Aug(:,i)==0)==m-1 && sum(Aug(:,i)==1) == 1)
            col = find(Aug(:,i)==1);
            BV(col) = i;
        end
    end
%end
BV
 
%%
 obj_val = cost(BV) * Aug(:, end);
    fprintf('Current value is %f',obj_val);
    zj = cost(BV) * Aug(:, 1:n-1);
    zj_cj = zj - cost;
 
    [value, entry] = min(zj_cj);
 
    if value >= 0
        fprintf("Optima reached with %f\n", obj_val);
        optima = 1;
        continue;
    end
%%
ratio  = Aug(:,n)./Aug(:,entry);  %take ratio
ind = (Aug(:,entry)<0|Aug(:,entry)==0);
ratio(ind) = NaN;
[min_ratio,leave] = min(ratio);
pivot = Aug(leave,entry)
 
%%
Aug(leave,:)= Aug(leave,:)/pivot;
Aug(leave,entry)  = 1;
 
for k = 1:m
    if k~= leave
        Aug(k,:) = Aug(k,:) - Aug(k,entry)*Aug(leave,:);
    end
end
BV(leave)=entry
end
 
 
 
Solution = zeros(n,1);
Solution(BV) = Aug(:,end);
disp(Solution(1:nn));
fprintf('Opt val is %f',obj_val);
