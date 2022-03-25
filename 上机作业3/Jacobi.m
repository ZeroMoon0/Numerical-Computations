%雅可比迭代法（异步迭代法）
function [X] = Jacobi(Matrix,n,b)
    X = zeros(n,1);
    ea = ones(n,1);
    M = diag(diag(Matrix));
    J = M\(M-Matrix);
    eig(J)
    f = M\b;
    while check(ea,n)%check函数检测是否达到容限，迭代过程如下
        X1 = J*X + f;
        for j = 1:n
            ea(j) = abs((X1(j) - X(j))/X1(j));
        end
        X = X1;
    end
end