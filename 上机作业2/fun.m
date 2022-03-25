function[patients] = fun(f,x)%f为具体的表达式，是一个函数，x为初始值
    es = 5e-6;%容限
    ea = 1;
    n = 0;
    data_n = [];%表格中的n值
    data_fx = [];%表格中的每次迭代值
    data_ea = [];%表格记录相对百分误差
    while ea>es && n<100  %当n达到100时，我们则认为选取g(x)发散了，无法获取到最终结果
        n = n + 1;
        fx = f(x);%以函数形式计算f(x)
        ea = abs((fx-x)/fx);
        x = fx;
        data_n(end+1) = n;%以下三式为向矩阵中添加数据
        data_fx(end+1) = fx;
        data_ea(end+1) = ea;
    end
    patients = table(data_n',data_fx',data_ea');%绘制表格
end