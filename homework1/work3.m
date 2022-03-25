x = 1/3;
ea = 1;
es = 0.00005;
sum =0;
n=0;
while ea>=es
    sum0 = sum;
    sum = sum + 2*(x^(2*n+1))/(2*n+1);
    n = n+1;
    ea = abs(sum - sum0)/sum;
end
true = double(log(2));
e = abs(sum-true)/true;


ea
e
n
sum