y = @(x)(exp(x));
%插值
table = SetTable(y,0.1,-4,4);%四个参数分别为函数，步长h，左区间，右区间，此函数构建等距节点函数值表
[n,~] = size(table);

ft = [];
x_temp = 100;
for i = 1:floor(n/2)
    x0 = table(2*i+1,1);
    x1 = table(2*i,1);
    x2 = table(2*i-1,1);
    y0 = table(2*i+1,2);
    y1 = table(2*i,2);
    y2 = table(2*i-1,2);
    f = @(t)( y0*(t-x1)*(t-x2)/(x0-x2)/(x0-x1) + y1*(t-x0)*(t-x2)/(x1-x2)/(x1-x0) + y2*(t-x0)*(t-x1)/(x2-x0)/(x2-x1) );%插值公式
    for k = x2:0.01:x0     
        if(k ~= x_temp)%去除掉重复得点
            ft(1,end+1) = f(k);
            ft(2,end) = k;
        end
    end 
    x_temp = x0;
end

plot(ft(2,:),ft(1,:),'b');%绘制插值图
hold on;

%绘制e的x次幂函数
x = -4:0.01:4;
yt = [];
for i = x
    yt(end+1) = y(i);    
end
plot(x,yt,'r');
