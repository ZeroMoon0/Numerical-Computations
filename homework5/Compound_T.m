function [output] = Compound_T(a,b,f,n)
    %复合梯形公式，传入参数为区间始终点a和b，函数f，被分成的区间数n
    output = f(a) + f(b);
    h = (b-a)/n;
    for i=1:n-1
        output = output + 2*f(h*i+a);
    end
    output = output*(b-a)/2/n;
end

