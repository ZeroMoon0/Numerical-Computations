function [output] = dm(x,h,f)%参数为被导的x，步长h，函数f
    output = (f(x+h)-f(x-h))/h/2;
end