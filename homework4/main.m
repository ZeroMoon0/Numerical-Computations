x = 2:16;
y = [6.7,8.2,9.58,9.5,9.7,10,9.96,9.99,10.49,10.59,10.6,10.8,10.6,10.9,10.76];
M = [x' y'];
%%
%插值

%拉格朗日插值代入第一个点和最后一个点
% f = Lagrange_1(x(1),x(end),y(1),y(end));
% fplot(f,[2,16]);
% hold on
% scatter(x,y);
% hold off

%拉格朗日插值代入第一个点，第8个点，和最后一个点
% f = Lagrange_2(x(1),x(8),x(end),y(1),y(8),y(end));
% fplot(f,[2,16]);
% hold on
% scatter(x,y);
% hold off

%分段一次拉格朗日插值，每两点间进行1次一次插值
% Interpolation_Split1(M);

%分段二次拉格朗日插值，每三点间进行1次二次插值
% Interpolation_Split2(M);


% figure(1);
% Interpolation_Spine2(M);%二次样条插值
% 
% % figure(2);
% Interpolation_Spine3(M);%三次样条插值

% 牛顿插值
% Newton(M);
%%

%拟合
% 第一种方法，双曲线
% x1 = [];
% y1 = [];
% for i = 1:length(x)
%     x1(i) = 1/x(i);
%     y1(i) = 1/y(i);
% end
% [a1,b1] = fit(x1,y1);
% f = @(x)(x/(a1*x+b1));
% 
% myplot(f,x,y);

%第二种方法，指数
x2 = [];
y2 = [];
for i = 1:length(x)
    x2(i) = 1/x(i);
    y2(i) = log(y(i));
end
[a2,b2] = fit(x2,y2);
b2 = exp(b2);

f = @(x)(b2*exp(a2/x));
myplot(f,x,y);


