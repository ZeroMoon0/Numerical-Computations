function [X] = Doolittle(A,n,b)
    X = zeros(n,1);
    %判断A的各阶顺序主子式是否为0，若都不为0，则满足LU分解条件
    for i=1:n
        if det(A(1:i,1:i)) == 0
            fprintf("A不满足LU分解条件");
            return;
        end
    end
    
    %A的LU分解
    L = diag(ones(n,1));
    U = zeros(n,n);
    for k = 1:n
        for i = k:n
            sum1 = 0;
            sum2 = 0;
            for j = 1:k-1
                sum1 = sum1 + L(k,j)*U(j,i);
                sum2 = sum2 + L(i,j)*U(j,k);    
            end
            U(k,i) = A(k,i) - sum1;
            L(i,k) = (A(i,k)-sum2)/U(k,k);
        end
    end
  
    %代入
    %向前带入LY=b
    Y = zeros(n,1);
    for k=1:n
        sum = 0;
        for j = 1:k-1
           sum = sum + L(k,j)*Y(j);
        end
        Y(k) = b(k) - sum;
    end
    
    %向后带入UX=Y
    for k=n:-1:1
        sum = 0;
        for j = k+1:n
           sum = sum + U(k,j)*X(j);
        end
        X(k) = (Y(k) - sum)/U(k,k);
    end
    


end

