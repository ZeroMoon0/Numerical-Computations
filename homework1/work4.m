x = single(1/3);
ea = 1;%近似百分比误差
es = 0.00005;%容限
sum =single(0);
n=0;
while ea>=es
    sum0 = sum;
    sum = sum + 2*(x^(2*n+1))/(2*n+1);%方法二公式
    n = n+1;
    ea = abs(sum - sum0)/sum;%近似百分比误差计算公式
end

true = single(log(2))
e = abs(sum-true)/true;

ea
e
n
sum