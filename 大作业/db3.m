function [output] = db3(x,h,f)
    %三点向后差商公式
    output = (f(x-2*h) - 4*f(x-h) + 3*f(x))/2/h;
end
