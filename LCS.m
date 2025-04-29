clc;
clear all;
 
A = [6 8 10 9; 9 12 13 7; 14 9 16 5];
S = [15; 25; 10];
D = [5 15 20 10];
[m, n] = size(A);
alloc = 0;
 
ts = sum(S(:));
td = sum(D(:));
 
if ts ~= td
    if td < ts
        D(n + 1) = ts - td;
        A = [A zeros(m, 1)];
    else
        S(m + 1) = td - ts;
        A = [A; zeros(n, 1)];
    end
end
 
[m, n] = size(A);
 
B = zeros(m, n);
Acost = A;
 
while alloc < m + n - 1
    val = min(Acost, [], "all");
    [r, c] = find(A == val);
 
    r = r(1);
    c = c(1);
 
    B(r, c) = min(S(r), D(c));
    alloc = alloc + 1;
 
    S(r) = S(r) - B(r, c);
    D(c) = D(c) - B(r, c);
 
    if (S(r) == 0) && (D(c) == 0)
        Acost(r, :) = Inf;
        S(r) = 1e-5;
    elseif S(r) == 0
        Acost(r, :) = Inf;
    else
        Acost(:, c) = Inf;
    end
end
 
'Allocation matrix B:'
B
 
'Initial transportation cost = '
Initial_Cost = sum(sum(A .* B))
