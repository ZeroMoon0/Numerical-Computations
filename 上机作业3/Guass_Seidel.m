%高斯-赛德尔迭代法（异步迭代法）
function [X] = Guass_Seidel(Matrix,n,b)
    X = zeros(n,1);
    ea = ones(n,1);
    M = tril(Matrix);
    G = inv(M)*(M-Matrix);
    eig(G)
    f = inv(M)*b;
    while check(ea,n)%check函数检测是否达到容限，迭代过程如下
        for j = 1:n
            sum = 0;
            for k=1:n
                sum = sum +  G(j,k)*X(k);
            end
            temp = X(j);
            X(j) = sum + f(j);
            ea(j) = abs((X(j) - temp)/X(j));
        end   
    end
end

