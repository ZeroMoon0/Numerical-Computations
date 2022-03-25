n = 1;%n级电阻网络
I0 = 1;
R = 1;

[A,b] = CreateMatrix(n,I0*R);


X1 = Cholesky(A,4*n-1,b);
vpa(X1',5)




