%列主元高斯消去法
function [X] = Guass_column(Matrix,n,b)
    
    %消去过程
    for k = 1:n-1
        a = Matrix(k:n,k); %取出矩阵的第i列向量
        [~,index] = max(abs(a));%得到向量中绝对值最大的元素下标
        index = index + k - 1;%将向量下标换算为矩阵的行
        if index ~= k%比对index是否为现在循环的行数，如果不是则把两行的元素进行交换
            Matrix([k index],:) = Matrix([index k],:);%交换Matrix矩阵的行元素
            temp = b(k);%交换b向量的元素
            b(k) = b(index);
            b(index) = temp;
        end
        for i = k+1:n %顺序消元法
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

