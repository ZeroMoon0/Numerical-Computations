w0 = 2.5;
E = 50000;
I = 30000;
L = 600;%杆长为6m


%二分法 funA(xl,xr) xl,xr为所求根在的区间
pA = funA(2.5,2.8);

%试位法 funB(xl，xr) xl,xr为所求根在的区间
pB = funB(2,3);

%不动点法 funC(x,f) x为初始值 经过多试验，我们测出x = (x + 36/x)/6 可满足条件,最终收敛到所求根,f为g(x)函数
f = @(x)((x + 36/x)/6 );%可更改
pC = funC(2,f);

%Newton-Raphson法 funD(x) x为初始值
pD = funD(10);

%割线法 funE(x1,x2) x1,x2为两个初始值
pE = funE(1,8);

x = 268.33;
y = (w0/(120*E*I*L))*(-x^5 + 2*(L^2)*(x^3)-(L^4)*x);
y







