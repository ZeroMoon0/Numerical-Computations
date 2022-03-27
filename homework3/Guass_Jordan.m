function [X] = Guass_Jordan(A,n,b)
    A = [A b];%增广矩阵
    for i=1:n
        x = A(i,i);
        for j = 1:n+1
            A(i,j) = A(i,j)/x;%除以主元
        end
        
        for j = 1:n%标准化
            y = A(j,i);
            if j~= i 
                for k = 1:n+1
                    A(j,k) = A(j,k) - y*A(i,k);
                end
            end
        end    
    end
    X = A(:,n+1);%获得增广矩阵的最后一列即为所求
end

