function [output] = df3(x,h,f)
    %三点向前差商公式
    output = (-3*f(x) + 4*f(x+h) - f(x+2*h))/2/h;
end

