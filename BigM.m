clc;
clear all;
 
% Inputs
A = [1 1 1; 2 -1 1];   % Constraint coefficients
B = [5; 4];            % RHS
C = [-3 -2 -1];        % Objective function
constr = [3; 3];       % 3 means '=' constraint
objective = 1;         % 1 = Minimize
 
[m, nn] = size(A);
M = 1000;              % Big M value
art_count = sum(constr == 3);
art_index = 1;
Aug = zeros(m, nn + art_count);  
 
% Add artificial variables
for i = 1:m
    if constr(i) == 3
        Aug(i, :) = [A(i, :) zeros(1, art_count)];
        Aug(i, nn + art_index) = 1;
        art_index = art_index + 1;
    end
end
 
Aug = [Aug B];             % Add RHS
[m, n] = size(Aug);        % Updated size
cost = [C zeros(1, art_count)];   % Initial cost
cost = [cost 0];           % Add cost for RHS
 
% Add -M for artificial vars
for i = 1:art_count
    cost(nn + i) = -M;
end
 
BV = zeros(m,1);
optima = 0;
 
% Identify initial basic variables
for i = 1 : n-1
    if(sum(Aug(:,i)==0)==m-1 && sum(Aug(:,i)==1) == 1)
        col = find(Aug(:,i)==1);
        BV(col) = i;
    end
end
 
% Iteration
while(optima == 0)
    obj_val = cost(BV) * Aug(:, end);
    fprintf('Current value is %f\n', obj_val);
 
    zj = cost(BV) * Aug(:, 1:n-1);
    zj_cj = zj - cost(1:n-1);   % Ensure size match
 
    [value, entry] = min(zj_cj);
    if value >= 0
        fprintf("\nOptima reached with %f\n", obj_val);
        optima = 1;
        break;
    end
 
    ratio = Aug(:,n)./Aug(:,entry);
    ratio(Aug(:,entry) <= 0) = inf;
    [min_ratio, leave] = min(ratio);
 
    if isinf(min_ratio)
        error("Unbounded solution");
    end
 
    pivot = Aug(leave,entry);
    Aug(leave,:) = Aug(leave,:) / pivot;
 
    for k = 1:m
        if k ~= leave
            Aug(k,:) = Aug(k,:) - Aug(k,entry)*Aug(leave,:);
        end
    end
    BV(leave) = entry;
end
 
% Final output
Solution = zeros(n,1);
Solution(BV) = Aug(:,end);
disp(Solution(1:nn));
fprintf('Opt val is %f\n', obj_val);
