function[patients]=funA(xl,xr)%xl,xr为左右边界
    ea = 1;
    es = 5e-6;
    n = 0;
    data_xm = [];
    data_n = [];
    data_ea = [];
    while ea>es && n<100  %当近似相对误差大于容限时进行迭代且n不能超过迭代次数上限
        xm = (xl+xr)/2;
        n = n + 1;
        if f(xl)*f(xm) > 0%根落在右区间
            xl = xm;
        elseif f(xl)*f(xm) < 0%根落在左区间
            xr = xm;
        else %根就是xm
            break;
        end
        xm_new = (xl+xr)/2;
        ea = abs((xm_new - xm)/xm_new);%近似相对误差计算公式
        data_xm(end+1) = xm_new;
        data_n(end+1) = n;
        data_ea(end+1) = ea;
    end   
    patients = table(data_xm',data_n',data_ea','VariableNames',{'x' '迭代次数n' 'εa'});%得到每次迭代结果及其误差的表格
end