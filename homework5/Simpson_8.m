function [output] = Simpson_8(x0,x1,x2,x3,f)
    %Simpson3/8公式
    output = (x3-x0)/8 * (f(x0)+3*f(x1)+3*f(x2)+f(x3));
end

