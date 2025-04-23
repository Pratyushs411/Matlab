clc;
clear all;
A = [-2 -1;1 1;-1 -1];
B = [-3;2;-2];
constr = [1;1;1];
c = [-2 -3];
obj = 1;
[m, nn] = size(A);
slackSurplus = 1;
E = eye(m);
for i = 1:m
    if constr(i) == 1
        Aug(i, :) = [A(i, :) E(slackSurplus, :)];
        slackSurplus = slackSurplus + 1;
    end
end
Aug = [Aug B];
[m, n] = size(Aug);
cost = [c zeros(1, n - nn - 1)];
BV = zeros(m, 1);
optima = 0;
 
while (optima == 0)
    for i = 1:n - 1
        if (sum(Aug(:, i) == 0) == m - 1 && sum(Aug(:, i) == 1) == 1)
            col = find(Aug(:, i) == 1);
            BV(col) = i;
        end
    end
 
    obj_val = cost(BV) * Aug(:, end);
    fprintf('Current obj val is %f\n', obj_val);
    zj = cost(BV) * Aug(:, 1:n - 1);
    zj_cj = zj - cost
 
    [value, entry] = min(zj_cj);
 
    RHS = Aug(:,end);
 
    if all(RHS>=0)
        fprintf('optima reached at %f \n', obj_val);
        optima = 1;
        break;
    end
 
    [min_val,leave] = min(RHS);
 
 
    ratios = inf(1,n-1);
 
    for i = 1:n-1
        if Aug(leave,i)<0
            ratios(i) = abs(zj_cj(i)/Aug(leave,i));
        end
    end
    %zj_cj = zj_cj - (zj-cj(1,entry)*Aug(leave,:))
    [min_ratio,entry] = min(ratios);
    if isinf(min_ratio)
        fprintf("infeasible solution");
    end
    to_divide = Aug(leave,entry);
    Aug(leave,:) = Aug(leave,:)/to_divide;
    Aug(leave,entry) = 1;
     for i = 1:m
        if i~=leave
            Aug(i,:) = Aug(i,:)-(Aug(i,entry)*Aug(leave,:));
        end
    end
end
 
 fprintf('Optimal Solution:\n');
 solution = inf(n-1,1);
 solution(BV) = Aug(:,end);
 solution';
optimal_obj_value = c*optimal_solution';
fprintf('Optimal Objective Value: %f\n', optimal_obj_value);
