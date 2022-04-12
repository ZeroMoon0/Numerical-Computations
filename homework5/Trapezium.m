function [output] = Trapezium(a,b,f)%传入起始点，终点，函数表达式
    %梯形公式
    output = (b-a)*(f(b)+f(a))/2;
end

