function [output] = Simpson_3(a,b,f)%传入参数为起点，终点，函数表达式
    %Simpson1/3公式
    output = (b-a)/6*(f(a)+4*f((a+b)/2)+f(b));
end

