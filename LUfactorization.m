format short;
clear all;
clc;
a = [1 -3 -2;2 -4 -3;-3 6 8];
b = [6;8;5];
c = [a b];
[L U] = lu(sym(a));
inverseL = adjoint(L)/det(L);
y = inverseL*b;
inverseU = adjoint(U)/det(U);
x = inverseU*y;
double(x)
