clc;
clear all;
close all;
 
syms x1 x2
 
f_syms = (-4*x1)-(6*x2)+(2*x1^2)+(2*x1*x2)+(2*x2^2);
grad_sym = gradient(f_syms,[x1 x2]);
grad_f = matlabFunction(grad_sym,'Vars',{x1,x2});
f = matlabFunction(f_syms,'Vars',{x1,x2});
 
[x1_grid,x2_grid] = meshgrid(-1:0.1:3,-1:0.1:3)
f_vals = f(x1_grid,x2_grid);
 
figure;
surf(x1_grid,x2_grid,f_vals);
xlabel('x_1')
ylabel('x_2')
grid('on')
hold('on')
title('surface plot')
 
x0 = [1.0,1.0]
alpha = 0.001
tol = 1e-5;
max_iter = 10000;
 
z0 = f(x0(1),x0(2));
scatter3(x0(1),x0(2),z0,30,'r','filled');
 
x = x0;
for i = 1:max_iter
    g = grad_f(x(1),x(2));
    if norm(g)<tol
        fprintf('converged in %d iterations\n',i);
        break
    end
    x = x - alpha*g;
 
end
 
if i==max_iter
    disp('Did not converge within minimum.')
else
     z = f(x(1),x(2));
    scatter3(x(1),x(2),z,30,'g','filled');
end
 
x
