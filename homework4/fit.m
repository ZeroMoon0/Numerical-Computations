function [a,b] = fit(x,y)  %最小二乘法拟合曲线,传入的x和y为两个行向量
    %求解最小二乘法的系数a和b
    %构建系数矩阵和方程右边列向量
    A = zeros(2,2);
    [~,n] = size(x);
    A(1,1) = n;
    A(1,2) = sum(x);
    A(2,1) = A(1,2);
    B = zeros(2,1);
    B(1) = sum(y);
    for i = 1:n
        A(2,2) = A(2,2) + x(i)^2;
        B(2) = B(2) + x(i)*y(i);
    end

    X = Guass_Jordan(A,2,B);%高斯约旦法求解出一个[a b]的2×1的列向量
    a = X(1);
    b = X(2);


end

