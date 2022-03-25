x = 1;
ea = 1;
es = 0.00005;
sum =0;
n=1;
while ea>=es
    sum0 = sum;
    sum = sum + ((-1)^(n+1))*(x^n)/n;
    n = n+1;
    ea = abs(sum - sum0)/sum;
end
true = double(log(2))
e = abs(sum-true)/true;


ea
e
n
sum