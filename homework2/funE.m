function[patients]=funE(x1,x2)%x1,x2为初始值
    ea = 1;
    es = 5e-6;
    n = 0;
    data_x3 = [];
    data_n = [];
    data_ea = [];
    while ea>es  %当近似相对误差大于容限时进行迭代
        x3 = x2 - f(x2)*(x2-x1)/(f(x2)-f(x1));
        ea = abs((x3-x2)/x3);  
        x1 = x2;
        x2 = x3;
        n = n+1;
        data_x3(end+1) = x3;
        data_n(end+1) = n;
        data_ea(end+1) = ea;  
    end
    patients = table(data_x3',data_n',data_ea','VariableNames',{'x' '迭代次数n' 'εa'});
end