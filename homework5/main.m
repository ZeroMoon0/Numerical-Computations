%%
%参数
u = 1800;
m0 = 160000;
q = 2500;
g = 9.8;

syms x;

%所求函数
v = @(t)(u*log(m0./(m0-q*t)) - g*t);
%v = @(x)(0.2+25.*x-200.*x.^2+675.*x.^3-900.*x.^4+400.*x.^5);
output_T = vpa(integral(v,0,30),8)
y = v(x);
%%
%梯形公式
output = vpa(Trapezium(0,30,v),8)
et = vpa(abs(output_T - output),4)
g = matlabFunction(diff(y,2));
ea = vpa(abs(integral(g,0,30)/30*(30-0)^3 *(-1/12)),4)
%%
%辛普森三分之一公式
output = vpa(Simpson_3(0,30,v),8)
et = vpa(abs(output_T - output),4)
g = matlabFunction(diff(y,4));
ea = vpa(abs(integral(g,0,30)/30*((30-0)/2)^5 *(-1/90)),4)
%%
%辛普森八分之三公式
output = vpa(Simpson_8(0,10,20,30,v),8)
et = vpa(abs(output_T - output),4)
g = matlabFunction(diff(y,4));
ea = vpa(abs(integral(g,0,30)/30*(30-0)^5/6480),4)
%%
%复合梯形公式
output = [];
ea =[];
et =[];
for i = 1:10
    output(end+1) = vpa(Compound_T(0,30,v,i),8);
    et(end+1) = vpa(abs(output_T - output(end)),4);
    g = matlabFunction(diff(y,2));
    ea(end+1) = vpa(abs(integral(g,0,30)/30*(30-0)^3/12/i/i),4);
end
patients = table((1:10)',output',et',ea','VariableNames',{'n','result','Ea','Et'})
%%
%复合Simpson公式，选择n=4与复合梯形公式进行对比
output = vpa(Compound_S(0,30,v,4),8)
et = vpa(abs(output_T - output),4)
g = matlabFunction(diff(y,4));
ea = vpa(abs(integral(g,0,30)/30*(30-0)^5/180/(4^4)),4)

%%
%龙贝格积分
output = vpa(Romberg(0,30,v,2e-5),8)
et = vpa(abs(output_T - output),4)


%%
%高斯积分法
output = [];
et = [];
for i = 1:6
    output(end+1) = vpa(Guass_Legendre(0,30,v,i),8);
    et(end+1) = vpa(abs(output_T - output(end)),4);
end
patients = table((1:6)',output',et','VariableNames',{'n','result','Ea'})

%%
%向前差商

t = 0:0.1:30;
y = [];
for i = t
    y(end+1) = df(i,0.5,v);    
end    
plot(t,y);  
    
    
%%
%向后差商
t = 0:0.1:30;
y = [];
for i = t
    y(end+1) = db(i,0.5,v);    
end    
plot(t,y);  

%%
%中间差商
t = 0:0.1:30;
y = [];
for i = t
    y(end+1) = dm(i,0.5,v);    
end    
plot(t,y); 

%%
%三点向前差商
t = 0:0.1:30;
y = [];
for i = t
    y(end+1) = df3(i,0.5,v);    
end    
plot(t,y);  

%%
%三点向后差商
t = 0:0.1:30;
y = [];
for i = t
    y(end+1) = db3(i,0.5,v);    
end    
plot(t,y);

%%
%Richardson外推法
t = 0:0.1:30;
y = [];
for i = t
    y(end+1) = d_Richardson(i,0.5,v,2e-5);    
end    
plot(t,y);







