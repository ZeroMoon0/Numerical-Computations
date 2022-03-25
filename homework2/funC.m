function[patients]=funC(x,f)%x为初始值
    ea = 1;
    es = 5e-6;
    n = 0;
    data_fx = [];
    data_n = [];
    data_ea = [];
    while ea>es && n<100 %当近似相对误差大于容限时进行迭代
        fx = f(x);
        ea = abs((fx - x)/fx);
        n = n+1;
        x = fx;
        data_fx(end+1) = fx;
        data_n(end+1) = n;
        data_ea(end+1) = ea;  
    end
    patients = table(data_fx',data_n',data_ea','VariableNames',{'x' '迭代次数n' 'εa'});
end