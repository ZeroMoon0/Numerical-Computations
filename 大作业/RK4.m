function output = RK4(a,b,y,f,h)%传入参数为起始点，终点，初值，f(x,y)，步长
    %经典的四阶龙格库塔法
    output = [];%最终返回一个包含每一步步长计算的矩阵
    output(end+1,1) = y;
    output(end,2) = a;
    for x=a:h:b-h           %迭代计算，直至终点
        k1 = f(x,y);
        k2 = f(x+h/2,y+h/2*k1);
        k3 = f(x+h/2,y+h/2*k2);
        k4 = f(x+h,y+h*k3);         %四阶龙格库塔法的经典做法
        y = y + (k1 + 2*k2 + 2*k3 + k4)/6*h;
        output(end+1,1) = y;
        output(end,2) = x+h;
    end
end

