function  Newton(M)
    %构建保存差商斜边的向量a
    a = M(:,2);
    [n,~] = size(M);
    for i = 2:n
        deltx = [];
        delty = [];
        for k = i:n
            deltx(end+1) = M(k,1) - M(k-i+1,1); %计算差商的分子
            delty(end+1) = a(k) - a(k-1);       %计算差商的分母
        end
        for k = i:n
            a(k) = delty(k-i+1)/deltx(k-i+1);
        end
    end
    
    %构建牛顿插值函数
    f = @(x)(a(1));
    for i = 2:n
        f1 = @(x)(x-M(1,1))*a(i);
        for j = 2:i-1
            f1 = @(x)(f1(x)*(x - M(j,1)));
        end
        f = @(x)f(x)+f1(x);
    end
    
    %绘制函数
    X = [];
    Y = [];
    for i = M(1,1):0.1:M(n,1)
        X(end+1) = i;
        Y(end+1) = f(i);
    end

    plot(M(:,1),M(:,2),'o',X,Y);
end

