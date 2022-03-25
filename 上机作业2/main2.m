f = @funC; %funA为第一种方法，funB为第二种方法，funC为第三种方法
for x=1:0.1:2
patients = fun(f,x) %获取迭代过程记录表格
end