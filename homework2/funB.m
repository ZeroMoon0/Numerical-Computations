function[patients]=funB(xl,xr)%xl,xr为左右边界
    ea = 1;
    es = 5e-6;
    n = 0;
    data_xm = [];
    data_n = [];
    data_ea = [];
    while ea>es  && n<100  %当近似相对误差大于容限时进行迭代且n不能超过迭代次数上限
        xm = xr - f(xr)*(xr-xl)/(f(xr)-f(xl));
        n = n + 1;
        if f(xl)*f(xm) > 0
            xl = xm;
        elseif f(xl)*f(xm) < 0
            xr = xm;
        else
            break;
        end
        xm_new = xr - f(xr)*(xr-xl)/(f(xr)-f(xl));
        ea = abs((xm_new - xm)/xm_new);%近似相对误差计算公式
        data_xm(end+1) = xm_new;
        data_n(end+1) = n;
        data_ea(end+1) = ea;
    end   
    patients = table(data_xm',data_n',data_ea','VariableNames',{'x' '迭代次数n' 'εa'});
end