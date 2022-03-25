%求取条件数  cond = ||A|| *||A-1||,选取1范数
function[cond] = Cond_1(Matrix,n)
    Matrix_1 = invhilb(n);%求精确逆矩阵
    sum_1 = sum(abs(Matrix));%求绝对值矩阵元素的列和
    norm1 = max(sum_1);%找出最大的列和，为1范数
    sum_2 = sum(abs(Matrix_1));
    norm2 = max(sum_2);
    cond = norm1 * norm2;%条件数求解

    
    











