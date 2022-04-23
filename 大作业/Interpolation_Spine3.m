function Interpolation_Spine3(M)
    %假设满足x0处的二阶导和xn处的二阶导均为0，自然边界条件
    h = [];
    [n,~] = size(M);
    for i = 2:n
        h(end+1) = M(i,1) - M(i-1,1);
    end
    lamuda = [];
    miu = [];%lamuda和miu为记录值
    g = [];%g为方程右边值
    for i = 1:n-2
        lamuda(end+1) = h(i+1)/(h(i) + h(i+1));
        miu(end+1) = h(i)/(h(i) + h(i+1));
        g(end+1) = 6*(((M(i+2,2)-M(i+1,2))/(M(i+2,1) - M(i+1,1)) - (M(i+1,2)-M(i,2))/(M(i+1,1) - M(i,1)))/(h(i)+h(i+1)));
    end
    
    A = diag(diag(2*ones(n-2)));

    A(1,2) = lamuda(1);
    %构建系数矩阵
    
    for i=2:n-3
       A(i,i-1) = miu(i);
       A(i,i+1) = lamuda(i);  
    end
    A(n-2,n-3) = miu(n-2);

    %求解一阶导数向量M1
    M1 = Guass_Jordan(A,n-2,g');
    M1 = [0;M1;0];
    %三次样条函数
    X = [];
    Y = [];
    k = 1;
    for i = M(1:1):0.1:M(n,1)
        if i == M(k+1,1)
            k = k + 1;
        end
        X(end+1) = i; 
        if k~= n   
            Y(end+1) = 1/(6*h(k))*(M1(k)*((M(k+1,1)-i)^3) + M1(k+1)*((i-M(k,1))^3)) + (M(k,2)-M1(k)*(h(k)^2)/6)*(M(k+1,1)-i)/h(k) + (M(k+1,2) - M1(k+1)*(h(k)^2)/6)*(i-M(k,1))/h(k);
        else
            Y(end+1) = M(n,2);
        end
    end

    %绘制图像
    plot(M(:,1),M(:,2),'o',X,Y)
       
end

