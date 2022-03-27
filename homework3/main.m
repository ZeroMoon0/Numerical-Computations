n = 1;%n级电阻网络
I0 = 1;
R = 1;
for i = 1:5
    [A,b] = CreateMatrix(i,I0*R);
    X1 = SOR(A,4*i-1,b);%函数可以自由替换 Guass，Guass_column,Guass_Jordan,Doolittle,Cholesky,Jacobi,Guass_Seidel,SOR
end






