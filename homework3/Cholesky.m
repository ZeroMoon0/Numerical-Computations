function [X] = Cholesky(A,n,b)
    %判断是否为对称正定矩阵
    X = zeros(n,1);
    if A ~= A'
        return;
    end
    lamuda = eig(A);
    for i = 1:size(lamuda)
        if lamuda(i) <= 0
            return;
        end
    end

    %LL'分解
    L = zeros(n,n);
    for k = 1:n
        sum = 0;
        for i = 1:k-1
            sum = sum + L(k,i)*L(k,i);
        end
        L(k,k) = sqrt(A(k,k) - sum);
        for j = k+1:n
            sum = 0;
            for i = 1:k-1
                sum = sum + L(k,i)*L(j,i);
            end
            L(j,k) = (A(j,k)-sum)/L(k,k);
        end                      
    end
    

    %带入
    Y = zeros(n,1);
    for k = 1:n
        sum = 0;
        for j = 1:k-1
            sum = sum + L(k,j)*Y(j);
        end
        Y(k) = (b(k) - sum)/L(k,k);    
    end

    for k = n:-1:1
        sum = 0;
        for j = k+1:n
            sum = sum + L(j,k)*X(j);
        end
        X(k) = (Y(k) - sum)/L(k,k);   
    end

end 

    
    

