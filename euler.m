format short
clear all
clc

% Define a function
f = @(x, y) (y - x) / (y + x);

% Input the parameters
x = input('Enter initial value of x: ');
y = input('Enter initial value of y(x): ');
h = input('Enter step size: ');
X = input('Enter x at which y is required: ');

Variables = {'x', 'y', 'fxy', 'newY'};
k = 1; % Set initial counter

while X >= x
    fprintf('Value of y at x=%f is %f\n', x, y);
    fxy = f(x, y);
    newy = y + h * fxy;
    
    % For printing purpose
    rsl(k, :) = [x, y, fxy, newy];
    k = k + 1;
    
    x = x + h;
    y = newy;
end

% Printing the result
resl = array2table(rsl);
resl.Properties.VariableNames(1:size(resl, 2)) = Variables;

% Print the optimal result
fprintf('The output of y(%f) = %f\n', X, rsl(end, 2));
