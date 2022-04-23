%%
clear;clc;
%散点图绘制
T = 0:1:20;%表示年份，题目所给的数据是以每10年为期的
P = [5.3,7.2,9.6,12.9,17.1,23.2,31.4,38.6,50.2,62.9,76.0,92.0,106.5,123.2,131.7,150.7,179.3,204.0,226.5,251.4,281.4];%人口数据
plot(T,P,'o');%绘制散点图观察趋势
xlabel('年份/十年，0代表1800年，20为2000年');
ylabel('美国人口/百万');
%%
%三次样条插值图像绘制
M1 = [T' P'];
figure(2);
Interpolation_Spine3(M1);
xlabel('年份/十年，0代表1800年，20为2000年');
ylabel('美国人口/百万');

%%
%马尔萨斯模型得线性拟合
lnP = log(P);%转换为对数形式
sum1 = 0;%sum1表示T(i)*lnP(i)得和
sum2 = 0;%sum2表示T(i)的平方和
sum3 = 0;
n = length(lnP);
for i = 1:n
    sum1 = sum1 + T(i)*lnP(i);
    sum2 = sum2  + T(i)^2;
    sum3 = sum3 + lnP(1)*T(i);
end
r =(sum1-sum3)/sum2;%最小二乘法算出增长率r

PMf = @(t)P(1)*exp(r*t);%马尔克斯模型函数

t = [];
PM = [];
for i = 0:0.1:n-1
    t(end+1) = i;
    PM(end+1) = PMf(i);
end

plot(T,P,'o',t,PM);%绘制图像
xlabel('年份/十年，0代表1800年，20为2000年');
ylabel('美国人口/百万');

%%
%Logistic模型
%离散模型参数拟合
n = length(P);
d_P = [];%保存(P(i+1) - P(i)) / P(i)
for i = 7:n-1
    d_P(end+1) = (P(i+1) - P(i)) / P(i);
end

[k,b] = fit(P(7:n-1),d_P);%7代表从1860年开始，线性拟合返回参数

%
lamuda = -k;
M = b/lamuda;

%利用四阶龙格库塔法求解常微分方程
f = @(x,y)lamuda*(M-y)*y;
output = RK4(0,n-7,P(7),f,0.1);%四阶龙格库塔法函数，返回一个矩阵

plot(output(:,2),output(:,1),0:1:14,P(7:end),'o');
xlabel('年份/十年，1860年开始');
ylabel('美国人口/百万');

%%
n = length(P);
dP_P = [];%保存dP/dt /P
for i = 7:n
    if i == 7
        temp = df3(i,1,P);%前向差商公式
    elseif i == n
        temp = db3(i,1,P);%后向差商公式
    else
        temp = dm(i,1,P);%中心差商公式
    end
    dP_P(end+1) = temp/P(i);
end

[k,b] = fit(P(7:n),dP_P);%线性拟合返回参数

lamuda = -k;
M = b/lamuda;

%利用四阶龙格库塔法求解常微分方程
f = @(x,y)lamuda*(M-y)*y;
output = RK4(0,n-2,P(7),f,0.1);

plot(output(:,2),output(:,1),0:1:14,P(7:end),'o');
xlabel('年份/十年，1860年开始');
ylabel('美国人口/百万');
