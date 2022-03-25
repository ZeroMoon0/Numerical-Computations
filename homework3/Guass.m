%原始高斯消去法

function [X] = Guass(Matrix,n,b)
    %消去过程

    for k = 1:n-1
        for i = k+1:n
            factor = Matrix(i,k)/Matrix(k,k);
            for j  = k+1:n
                Matrix(i,j) = Matrix(i,j) - factor * Matrix(k,j);
            end
            b(i) = b(i) - factor * b(k);
        end
    end
    
    %回代过程
    X(n) = b(n)/Matrix(n,n);
    for i = n-1:-1:1
        sum = b(i);
        for j = i+1:n
            sum = sum - Matrix(i,j)*X(j);
        end
        X(i) = sum/Matrix(i,i);
    end
end

