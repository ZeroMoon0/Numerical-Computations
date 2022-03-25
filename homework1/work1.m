x = single(1);
ea = 1;%近似百分比误差
es = 0.00005;%容限
sum = single(0);
n=1;
while ea>=es
    sum0 = sum;
    sum = sum + ((-1)^(n+1))*(x^n)/n;
    n = n+1;
    ea = abs(sum - sum0)/sum;%近似百分比误差计算公式
end

true = single(log(2))
e = abs(sum-true)/true;


ea
e
n
sum