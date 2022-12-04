function[E] = DEA(X, Y)
n = size(X',1);
m = size(X, 1);
s = size(Y, 1);
A = [-X', Y'];
b = zeros(n,1);
LB = zeros(m+s, 1);
UB = [];
E = zeros(n, n);
w = zeros(m+s, n);
for i = 1:n
    f = [zeros(1, m) -Y(:,i)'];
    Aeq = [X(:,i)' zeros(1,s)];
    beq = 1;
    w(:, i) = linprog(f, A, b, Aeq, beq, LB, UB);
    E(i,i) = Y(:,i)'* w(m+1:m+s, i);
end
end