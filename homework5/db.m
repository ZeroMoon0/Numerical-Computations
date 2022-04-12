function [output] = db(x,h,f)%参数为被导的x，步长h，函数f
    output = (f(x)-f(x-h))/h;
end

