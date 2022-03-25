%(1)
for n = [2,6,10]
    A = hilb(n);
    A(n,n) = A(n,n);
    cond = Cond_1(A,n);
    cond
end

n = 6;
A = hilb(n);
%扰动误差
%A1 = zeros(n,n);
% A1(n,n) = 1e-4;
% sum_1 = sum(abs(A));%求绝对值矩阵元素的列和
% norm1 = max(sum_1);%找出最大的列和，为1范数
% sum_2 = sum(abs(A1));%求绝对值矩阵元素的列和
% norm2 = max(sum_2);%找出最大的列和，为1范数
% 
% err = norm1/norm2

b = ones(n,1);
%原始高斯消去法
X1 = Guass(A,n,b);
vpa(X1,5)

%列主元高斯消去法
X2 = Guass_column(A,n,b);
vpa(X2,5)

%高斯赛德尔迭代法
X3  = Guass_Seidel(A,n,b);
vpa(X3',5)

%高斯赛德尔迭代法
X4  = Guass_Jordan(A,n,b);
vpa(X4',5)

X5 = Jacobi(A,n,b);
vpa(X5',5)