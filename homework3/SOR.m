%SOR（逐次超松弛迭代法）
function [X] = SOR(A,n,b)
    X = zeros(n,1);
    ea = ones(n,1);
    w = 1.5;%松弛因子
    p = 0;
    while check(ea,n)%check函数检测是否达到容限，迭代过程如下
        p = p+1;
        for j = 1:n
            sum = 0;
            for k=1:n
                sum = sum + A(j,k)*X(k);
            end           
            temp = X(j);
            X(j) = (b(j) - sum)*w/A(j,j) + X(j);
            ea(j) = abs((X(j) - temp)/X(j));
        end   
    end
    p
end