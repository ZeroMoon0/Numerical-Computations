function myplot(f,x,y)
    %绘制图像
    X = [];
    Y = [];
    for i = x(1):0.1:x(end)
        X(end+1) = i;
        Y(end+1) = f(i);
    end

    plot(x,y,'o',X,Y);

    %均方误差计算
    sum = 0;
    for i = 1:1:length(x)
        sum = sum + (y(i) - f(x(i)))^2;
    end
    fprintf("此方法的均方误差为" + sum/length(x));

end

