function[patients]=funD(x)%x为初始值
    ea = 1;
    es = 5e-6;
    n = 0;
    data_x1 = [];
    data_n = [];
    data_ea = [];
    while ea>es && n<100 %当近似相对误差大于容限时进行迭代
        x1 = x - f(x)/f1(x);%牛顿法的不动点计算公式
        ea = abs((x1 - x)/x1);
        n = n+1;
        x = x1;
        data_x1(end+1) = x1;
        data_n(end+1) = n;
        data_ea(end+1) = ea;  
    end
    patients = table(data_x1',data_n',data_ea','VariableNames',{'x' '迭代次数n' 'εa'});
    
end